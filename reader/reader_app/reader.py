import logging
from datetime import datetime

import feedparser
import arrow

from django.conf import settings

from .models import Currency, ReferenceRates


def create_currency(code):
    currency = Currency(code=code)
    currency.save()
    return currency


def etag_already_saved(feed, currency):
    return feed.etag == currency.etag


def rate_already_saved(currency, updated):
    rate = ReferenceRates.objects.filter(currency=currency, updated=updated).first()
    if rate:
        return True
    return False


def run_reader():
    for code in settings.CURRENCY_CODES:
        feed = feedparser.parse(f'https://www.ecb.europa.eu/rss/fxref-{code.lower()}.html')

        if feed:
            currency_obj = Currency.objects.filter(code=code).first()
            if not currency_obj:
                logging.debug(f'create currency {code}')
                currency_obj = create_currency(code)

            if etag_already_saved(feed, currency_obj):
                logging.debug(f'values with etag: {feed.etag} already saved')
                continue

            currency_obj.etag = feed.etag
            currency_obj.save()

            for entry in feed.entries:
                exchange_rate = entry['cb_exchangerate'].split('\n')[0]
                updated = arrow.get(entry['updated']).datetime
                if rate_already_saved(currency_obj, updated):
                    logging.debug(f'values for {code} {updated} already saved')
                    continue
                rate = ReferenceRates()
                rate.exchange_rate = exchange_rate
                rate.updated = updated
                rate.currency = currency_obj
                rate.save()
