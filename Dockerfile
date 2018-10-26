FROM python:3.7-stretch

MAINTAINER Juan Darien Macías Hernández <darienmh@gmail.com>

WORKDIR /app/

ADD requirements.txt /app/requirements.txt

RUN apt-get update && apt-get install -y --no-install-recommends \
    default-jdk \
    python-dev \
    python3-dev \
    python3-ldap3 \
    python3-greenlet \
    python3-gevent \
    libldap2-dev \
    libssl-dev \
    libsasl2-dev \
    gunicorn \
    libfontconfig \
    wkhtmltopdf \
    unzip \
    libevent-dev \
    tar
    #&& \
    #apt-get install -y --no-install-recommends default-jdk

# install python dependencies
RUN pip3 install -r /app/requirements.txt

# -----------------------------------------------------------------------------
# Clean up
# -----------------------------------------------------------------------------
RUN apt-get clean && \
  apt-get autoclean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


# create unprivileged user
RUN adduser --disabled-password --gecos '' sipacuser
