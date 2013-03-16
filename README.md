## Timezoner

A tiny service for detecting timezones by coordinates so you don't need to be dependent on online ones.

## Install

Clone the repository and run the bootstrap script:

```
bin/bootstrap
```

## Using

```
rails s
```

and just pass latitude and longitude:

```
curl "http://localhost:3000/timezone?lat=53&lng=27"
{"timezone":"Europe/Minsk"}%
```

## Dependencies

### PostGIS

PostGIS version >= 1.5 is required.

On Ubuntu simply install required packages with apt-get:

```
apt-get install postgresql-9.1-postgis
```

On Mac you can use [Postgres.app](http://postgresapp.com/) or install PostGIS using `brew`.

Don't forget to look through `database.yml` and pick right settings depending on PostgreSQL and PostGIS versions.

### Geos

Ubuntu:

```
apt-get install libgeos-dev
```

Homebrew:

```
brew install geos
```

You might need to reinstall `rgeo` gem to make it support geos. It's possible to uninstall and install it:

```
bundle exec gem uninstall rgeo
bundle install
```
