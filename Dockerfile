FROM python:3.9-slim-buster

RUN apt-get update && \
    apt-get install nginx -y && \
    rm -rf /var/lib/apt/lists/*

COPY nginx.conf /etc/nginx/conf.d/nginx.conf

RUN pip install flask psycopg2-binary flask-sqlalchemy

WORKDIR /app
COPY app.py /app/app.py
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

ENTRYPOINT ./entrypoint.sh