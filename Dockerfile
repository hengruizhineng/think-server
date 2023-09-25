FROM ubuntu:22.04
LABEL version="1.0.0"
LABEL vendor="hrzn.ltd"

ENV DEBIAN_FRONTEND noninteractive
ENV ACCEPT_EULA Y

RUN apt-get update -y \
  && apt-get upgrade -y \
  && apt-get install -y apt-utils locales  \
  && apt-get autoclean && apt-get autoremove && rm -rf /var/lib/apt/lists/* \
	&& localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

# 基础功能
RUN apt-get update -y \
  && apt-get install -y \
  curl \
  wget \
  net-tools \
  openssl \
  unzip \
  pkg-config \
  && apt-get autoclean && apt-get autoremove && rm -rf /var/lib/apt/lists/*


# Web环境
RUN apt-get update -y \
  && apt-get install -y \
  nginx \
  php-fpm \
  php-cli \
  php-imagick \
  php-json \
  php-services-json \
  php-mail \
  php-mbstring \
  php-memcached \
  php-mongodb \
  php-redis \
  php-xml \
  php-zip \
  php-ssh2 \
  php-curl \
  php-gd \
  php-mysql \
  php-odbc \
  php-sqlite3 \
  php-xmlrpc \
  php-sybase \
  php-amqp \
  php-geos \
  php-http-request \
  php-log \
  php-net-socket \
  php-pgsql \
  php-yaml \
  php-pear \
  php-dev \
  librdkafka-dev \
  libmosquitto-dev \
  composer \
  && apt-get autoclean && apt-get autoremove && rm -rf /var/lib/apt/lists/*


ADD etc /etc


ADD bin /bin
RUN chmod a+x /bin/app_install.sh && /bin/app_install.sh


ADD app /app
WORKDIR /app

ENV VERSION 1
ENV PATH "/app:$PATH"

EXPOSE 80
ENTRYPOINT ["/bin/app_init.sh"]
CMD [ "/bin/app_start.sh" ]
