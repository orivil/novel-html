#!/usr/bin/env bash
update-html.sh
nohup html-update-server >nohup.log 2>&1 &
nginx -g 'daemon off;'
