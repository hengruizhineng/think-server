FROM ubuntu:23.04
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


RUN pecl install rdkafka
RUN echo extension=rdkafka.so > /etc/php/8.1/mods-available/rdkafka.ini
RUN phpenmod rdkafka

RUN pecl install Mosquitto-0.4.0
RUN printf "; priority=40\nextension=mosquitto.so\n" > /etc/php/8.1/mods-available/mosquitto.ini
RUN phpenmod mosquitto

RUN pecl install swoole
RUN printf "; priority=40\nextension=swoole.so\n" > /etc/php/8.1/mods-available/swoole.ini
RUN phpenmod swoole

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
