FROM python:3.11-bullseye

ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1

# TODO: Build psycopg2-binary from source...right now this is just the pip binary
# https://www.psycopg.org/docs/install.html
RUN apt-get update && apt-get install -y gcc python3-psycopg2 xmlsec1

COPY ./webservices/requirements.txt /tmp
RUN pip3 install -r /tmp/requirements.txt
RUN rm /tmp/requirements.txt

# https://stackoverflow.com/questions/32022014/auto-reloading-of-code-changes-with-django-development-in-docker-with-gunicorn
WORKDIR /app
COPY . /app
