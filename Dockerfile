FROM python:3.7-stretch

MAINTAINER Juan Darien Macías Hernández <darienmh@gmail.com>

WORKDIR /app/

RUN mkdir app && apt-get update && apt-get install -y --no-install-recommends \
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

ADD requirements.txt /app/requirements.txt

RUN pip3 install -U pip

RUN apt-get install -y default-jdk

# install python dependencies
RUN pip3 install -r /app/requirements.txt

# create unprivileged user
RUN adduser --disabled-password --gecos '' sipacuser
