#!/bin/bash

if [ -f "/bin/app_web_start.sh" ]; then
  /bin/app_web_start.sh &
fi

if [ -f "/bin/app_notebook.sh" ]; then
  /bin/app_notebook.sh &
fi

if [ -f "/app/init.sh" ]; then
chmod a+x /app/init.sh
/app/init.sh
fi

if [ -f "/app/start.sh" ]; then
chmod a+x /app/start.sh
/app/start.sh
fi


if [ -t 0 ]; then
  exec /bin/bash
else
  while true; do sleep 1000; done
fi
