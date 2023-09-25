#!/bin/bash


if [ -f "/app/wwwroot/init.sh" ]; then
chmod a+x /app/wwwroot/init.sh
/app/wwwroot/init.sh
fi

