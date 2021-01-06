embulk-output-elasticsearch bug repro

```
docker-compose build embulk
docker-compose up elasticsearch
docker-compose run --rm embulk run tsv_to_json.yml
docker-compose run --rm embulk run tsv_to_es.yml
docker-compose run --rm embulk run jsonl_to_es.yml
```
