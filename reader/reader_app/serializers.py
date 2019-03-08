from rest_framework import serializers
from .models import ReferenceRates


class RatesSerializer(serializers.ModelSerializer):
    currency = serializers.StringRelatedField()

    class Meta:
        model = ReferenceRates
        fields = ('currency', 'exchange_rate', 'updated')
