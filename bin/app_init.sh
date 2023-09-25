#!/bin/bash

# 初始化基本目录结构
if [ ! -d "/app/log" ]; then
mkdir /app/log
fi

if [ ! -d "/run/php" ]; then
mkdir /run/php
fi


if [ ! -d "/app/log/nginx" ]; then
mkdir /app/log/nginx
fi


if [ ! -d "/app/wwwroot" ]; then
mkdir /app/wwwroot
echo "<?php phpinfo(); ?>" > /app/wwwroot/index.php
fi


# 响应指令

if [ "$1" = "shell" ]; then
/bin/bash
exit 0
fi

if [ "$1" = "bash" ]; then
/bin/bash
exit 0
fi


eval "$@"
