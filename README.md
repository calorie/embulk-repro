embulk-output-elasticsearch bug repro

### JSON array

https://github.com/embulk/embulk-base-restclient/issues/136

https://gist.github.com/calorie/d5457ba7cb6f5695dbaea7575e082918

```
docker compose build embulk
docker compose up elasticsearch
docker compose run --rm embulk java -jar /usr/loca/bin/embulk run tsv_to_json.yml
docker compose run --rm embulk java -jar /usr/loca/bin/embulk run tsv_to_es.yml
docker compose run --rm embulk java -jar /usr/loca/bin/embulk run jsonl_to_es.yml
```

### Memory leak

```
docker compose build embulk
docker compose up elasticsearch
ruby jsonl.rb
docker compose run --rm embulk java -jar /usr/loca/bin/embulk run memory_leak.yml
```

```
docker compose run --rm embulk java -cp "/jar/*" org.embulk.cli.Main run -b /embulk /app/stdout.yml
```
