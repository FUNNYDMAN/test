#!/bin/sh

set -ex

until nc -w 1 -z postgres 5432; do
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 1
done
>&2 echo "Postgres is up - executing command"


flask run --host=0.0.0.0
