from datetime import datetime

from django.test import TestCase

import feedparser

from .models import ReferenceRates, Currency

from .reader import etag_already_saved, rate_already_saved


class TestEtagSaved(TestCase):
    def test_etag(self):
        """Animals that can speak are correctly identified"""
        feed = feedparser.parse('https://www.ecb.europa.eu/rss/fxref-usd.html')
        curr = Currency(code='USD')
        saved = etag_already_saved(feed, curr)
        self.assertFalse(saved)
        curr.etag = feed.etag
        curr.save()
        saved = etag_already_saved(feed, curr)
        self.assertTrue(saved)

    def test_rate_saved(self):
        feed = feedparser.parse('https://www.ecb.europa.eu/rss/fxref-usd.html')
        curr = Currency(code='USD')

        entry = feed.entries[0]
        updated = datetime.fromisoformat(entry['updated'])

        saved = rate_already_saved(curr, updated)
        self.assertFalse(saved)

        exchange_rate = entry['cb_exchangerate'].split('\n')[0]
        rate = ReferenceRates()
        rate.exchange_rate = exchange_rate
        rate.updated = updated
        rate.currency = curr
        rate.save()

        saved = rate_already_saved(curr, feed)
        self.assertTrue(saved)
