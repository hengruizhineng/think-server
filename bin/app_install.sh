#!/bin/bash

if [ -f "/bin/app_init.sh" ]; then
chmod a+x /bin/app_init.sh
fi

if [ -f "/bin/app_start.sh" ]; then
chmod a+x /bin/app_start.sh
fi

if [ -f "/bin/app_web_start.sh" ]; then
chmod a+x /bin/app_web_start.sh
fi


