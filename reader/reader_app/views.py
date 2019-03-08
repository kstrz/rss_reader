from rest_framework import viewsets
from rest_framework.response import Response

from .serializers import RatesSerializer
from .models import ReferenceRates


class RatesViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = ReferenceRates.objects.all()
    serializer_class = RatesSerializer

    def list(self, request, *args, **kwargs):

        queryset = self.filter_queryset(self.get_queryset())
        currency_code = request.query_params.get('code', None)
        if currency_code:
            queryset = queryset.filter(currency__code=currency_code)

        page = self.paginate_queryset(queryset)
        if page is not None:
            serializer = self.get_serializer(page, many=True)
            return self.get_paginated_response(serializer.data)

        serializer = self.get_serializer(queryset, many=True)
        return Response(serializer.data)
