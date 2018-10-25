FROM python:3.7-stretch

RUN apt-get update && apt-get install -y --no-install-recommends \
    python3-dev \
    libsasl2-dev \
    python-dev \
    libldap2-dev \
    libssl-dev \
    python3-ldap3 \
    gunicorn \
    libfontconfig \
    wkhtmltopdf \
    wget \
    unzip \
    tar
#RUN    default-jdk