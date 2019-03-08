from django.db import models

# Create your models here.


class Currency(models.Model):
    code = models.CharField(max_length=3)
    etag = models.CharField(max_length=20, null=True)

    def __str__(self):
        return self.code


class ReferenceRates(models.Model):
    currency = models.ForeignKey(Currency, on_delete=models.DO_NOTHING)
    updated = models.DateTimeField()
    exchange_rate = models.FloatField()

    class Meta:
        unique_together = ('currency', 'updated',)
