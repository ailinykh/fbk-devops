#!/bin/bash

set -e

# start nginx
nginx

# setup flask
export FLASK_APP=app.py
# flask db init
# flask db migrate
# flask db upgrade

# run flask
flask run