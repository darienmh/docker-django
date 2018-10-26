FROM python:3.7-alpine

MAINTAINER Juan Darien Macías Hernández <darienmh@gmail.com>

WORKDIR /app/

# Add Python Dependencies
ADD requirements.txt /app/requirements.txt

RUN set -ex \
    && apk update \

    # Install Tools
    && && apk add --no-cache --virtual .persistent-deps \
        python-dev \
        python3-dev \
        python3-ldap3 \
        libldap2-dev \
        libssl-dev \
        libsasl2-dev \
        gunicorn \
        libfontconfig \
        wkhtmltopdf \

    # Install Python Dependencies
    && pip3 install -r /app/requirements.txt \

    # Clean up
    && apt-get clean \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

