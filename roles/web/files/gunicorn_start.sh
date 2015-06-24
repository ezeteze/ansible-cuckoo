#!/bin/bash

NAME="cuckoo_app"
DJANGODIR=/home/cuckoo/cuckoo-1.2/web
SOCKFILE=/home/cuckoo/cuckoo-1.2/web/gunicorn.sock
NUM_WORKERS=3
DJANGO_SETTINGS_MODULE=web.settings
DJANGO_WSGI_MODULE=web.wsgi

cd /home/cuckoo/cuckoo-1.2/web
exec gunicorn ${DJANGO_WSGI_MODULE}:application \
  --name $NAME \
  --workers $NUM_WORKERS \
  --bind=unix:$SOCKFILE
