#!/bin/bash


/usr/sbin/php-fpm8.3 -R --nodaemonize -c /etc/php/8.3/fpm/php.ini --fpm-config /etc/php/8.3/fpm/php-fpm.conf &

/usr/sbin/nginx -g 'daemon off; master_process on;'
