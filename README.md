# OneBit Secret Friend

## Build

```bash
$ docker-compose build
```

## Running

```bash
$ docker-compose up --build
```

## Setting database

```bash
$ docker-compose run --rm web bundle exec rake db:create
$ docker-compose run --rm web bundle exec rake db:migrate
```
