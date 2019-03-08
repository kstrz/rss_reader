# rss_reader

Kod readera w `reader_app/reader.py.` 

Api posiada jeden endpoint `rates/`

Opcjonalny parametr `page`

Opcjonalny parametr `code` - kod waluty


Uruchamianie aplikacji: `docker-compose up`


Przykładowe zapytania:

`http://127.0.0.1:8000/rates/?code=PLN`

`http://127.0.0.1:8000/rates/?page=2`


Pojedyncze uruchomienie readera:

`docker exec -it rss_pp  python3 /code/manage.py run_reader`
