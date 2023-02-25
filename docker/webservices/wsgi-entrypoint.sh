#!/bin/sh

set -e

echo "Waiting for server volume..."
cd /app/webservices

echo "Waiting for db to be ready..."
./manage.py migrate
sleep 2

./manage.py collectstatic --noinput

gunicorn -c /app/docker/webservices/gunicorn.conf.py webservices.wsgi
