FROM python:3.5-stretch

MAINTAINER Juan Darien Macías Hernández <darienmh@gmail.com>

WORKDIR /app/

# Add Python Dependencies
ADD requirements.txt /app/requirements.txt

RUN set -ex \
    && apt-get update \

    # Install Tools
    && apt-get install -y --no-install-recommends \
        default-jdk \
        python-dev \
        python3-dev \
        python3-ldap3 \
        libldap2-dev \
        libssl-dev \
        libsasl2-dev \
        gunicorn \
        libfontconfig \
        wkhtmltopdf \
        unzip \

    # Install Python Dependencies
    && pip3 install -r /app/requirements.txt \

    # Clean up
    && apt-get clean \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \

    && adduser --disabled-password --gecos '' sipacuser \

    && mkdir -p /var/log/gunicorn \
    && chown -R sipacuser /var/log/gunicorn