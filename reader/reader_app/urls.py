from django.urls import include, path
from rest_framework import routers
from .views import RatesViewSet

router = routers.DefaultRouter()
router.register(r'rates', RatesViewSet)

urlpatterns = [
    path('', include(router.urls)),
]
