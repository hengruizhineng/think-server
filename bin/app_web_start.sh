#!/bin/bash


/usr/sbin/php-fpm8.1 -R --nodaemonize -c /etc/php/8.1/fpm/php.ini --fpm-config /etc/php/8.1/fpm/php-fpm.conf &

/usr/sbin/nginx -g 'daemon off; master_process on;'
