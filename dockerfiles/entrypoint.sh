#!/usr/bin/env bash


until nc -z -v -w30 $DB_HOST 3306
do
  echo "Waiting for db"
  sleep 1
done

python3 /code/manage.py runserver 0.0.0.0:8000
