FROM python:3.7-alpine

MAINTAINER Juan Darien Macías Hernández <darienmh@gmail.com>

WORKDIR /app/

# Add Python Dependencies
ADD requirements.txt /app/requirements.txt

RUN set -ex \
    && apk update \

    && apk add --no-cache --virtual .fetch-deps \
    		gnupg \
    		tar \
    		xz \
#    		openjdk8 \

#    mkdir -p /opt/java
#    cd /opt/java
#    sudo tar -zxvf XXX-XXX-linux-x64.tar.gz
#    && wget -O python.tar.xz.asc "https://www.python.org/ftp/python/${PYTHON_VERSION%%[a-z]*}/Python-$PYTHON_VERSION.tar.xz.asc" \
#    && export GNUPGHOME="$(mktemp -d)" \
#
#    # Install Tools
    && apk add --no-cache --virtual .persistent-deps \
        openjdk8
        python-dev \
        python3-dev \
#        python3-ldap3 \
#        libldap2-dev \
#        libssl-dev \
#        libsasl2-dev \
#        gunicorn \
#        libfontconfig \
#        wkhtmltopdf \

    # Install Python Dependencies
#    && pip3 install -r /app/requirements.txt \
#
#    # Clean up
#    && apt-get clean \
#    && apt-get autoclean \
#    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
#
#    && adduser --disabled-password --gecos '' sipacuser \
#
#    && mkdir -p /var/log/gunicorn \
#    && chown -R sipacuser /var/log/gunicorn