import logging

from django.core.management.base import BaseCommand

from reader_app.reader import run_reader


class Command(BaseCommand):
    def handle(self, *args, **options):
        logging.info('running reader')
        run_reader()
