embulk-output-elasticsearch bug repro

https://gist.github.com/calorie/d5457ba7cb6f5695dbaea7575e082918

```
docker-compose build embulk
docker-compose up elasticsearch
docker-compose run --rm embulk run tsv_to_json.yml
docker-compose run --rm embulk run tsv_to_es.yml
docker-compose run --rm embulk run jsonl_to_es.yml
```
