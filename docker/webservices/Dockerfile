FROM python:3.11-bullseye

ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1

WORKDIR /app

# TODO: Build psycopg2-binary from source...right now this is just the pip binary
# https://www.psycopg.org/docs/install.html
RUN apt-get update && apt-get install -y gcc python3-psycopg2 xmlsec1

COPY ./webservices/requirements.txt /app/webservices/
RUN pip3 install -r /app/webservices/requirements.txt

COPY ./docker /app/docker
COPY ./webservices /app/webservices

# ensure all the entrypoints have executable permissions
RUN chmod +x /app/docker/webservices/wsgi-entrypoint.sh
RUN chmod +x /app/docker/scheduler/scheduler-entrypoint.sh
RUN chmod +x /app/docker/worker/worker-entrypoint.sh
