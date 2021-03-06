# Generated by Django 2.1.7 on 2019-03-07 14:47

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Currency',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('code', models.CharField(max_length=3)),
                ('etag', models.CharField(max_length=20, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='ReferenceRates',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('updated', models.DateTimeField()),
                ('exchange_rate', models.FloatField()),
                ('currency', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='reader_app.Currency')),
            ],
        ),
        migrations.AlterUniqueTogether(
            name='referencerates',
            unique_together={('currency', 'updated')},
        ),
    ]
