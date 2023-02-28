#!/bin/sh

set -e

echo "Waiting for server volume..."
cd /app/webservices

# echo "Waiting for db to be ready..."
# ./manage.py migrate
# sleep 2

# # TODO: figure out static file deployment with nginx
# ./manage.py collectstatic --noinput

gunicorn -c /app/docker/backend/gunicorn.conf.py webservices.wsgi
