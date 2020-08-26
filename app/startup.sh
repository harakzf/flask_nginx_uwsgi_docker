#!/bin/bash

cd /var/app

# uwsgi起動
uwsgi --socket 127.0.0.1:3031 --chdir /var/app/ --wsgi-file app.py --callable app --master --processes 4 --threads 2 & 

# nginx起動
nginx -g "daemon off;"
