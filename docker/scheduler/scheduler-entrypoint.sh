#!/bin/bash

set -e

cd webservices

if [ -f "/tmp/celerybeat.pid" ]; 
then
rm /tmp/celerybeat.pid
fi

if [ -f "/tmp/celerybeat-schedule" ]; 
then
rm /tmp/celerybeat-schedule
fi

celery --app=webservices beat --loglevel=INFO --pidfile /tmp/celerybeat.pid -s /tmp/celerybeat-schedule
