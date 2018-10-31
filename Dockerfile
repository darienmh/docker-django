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
            autoconf \
            file \
            g++ \
            make \
            libc-dev \
            pkgconf \

#    mkdir -p /opt/java
#    cd /opt/java
#    sudo tar -zxvf XXX-XXX-linux-x64.tar.gz
#    && wget -O python.tar.xz.asc "https://www.python.org/ftp/python/${PYTHON_VERSION%%[a-z]*}/Python-$PYTHON_VERSION.tar.xz.asc" \
#    && export GNUPGHOME="$(mktemp -d)" \
#
#    # Install Tools
    && apk add --no-cache --virtual .persistent-deps \
        openjdk8 \
        python-dev \
        python3-dev \
        py3-ldap3 \
        libsasl \
        py-gunicorn \

        #WkHtmltoPdf
        libxrender \
        fontconfig \
        libx11 \
        libxext \
        libintl \
        glib \
        libgcc \
        libstdc++ \
        ttf-freefont \
        ttf-dejavu \
        ttf-droid \
        ttf-freefont \
        ttf-liberation \
        ttf-ubuntu-font-family \
#        wkhtmltopdf \

        # psycopg2 dependencie
        libpq \

    # Install Python Dependencies
    && pip3 install -r /app/requirements.txt \
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