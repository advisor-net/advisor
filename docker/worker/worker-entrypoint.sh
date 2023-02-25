#!/bin/bash

set -e

# https://www.distributedpython.com/2019/04/23/celery-reload/
cd webservices
if [ $DEBUG == 1 ]
then
  echo "Running worker in debug mode"
  watchmedo auto-restart --directory=/app/webservices/webservices --pattern="*.py" --recursive -- celery --app=webservices worker --loglevel=INFO
else
  celery --app=webservices worker --loglevel=INFO
fi
