#!/bin/sh
###
 # @Author       : BobAnkh
 # @Github       : https://github.com/BobAnkh
 # @Date         : 2021-10-08 18:14:19
 # @LastEditors  : BobAnkh
 # @LastEditTime : 2021-10-09 15:42:44
 # @Description  : 
 # Copyright 2021 BobAnkh
### 

set -e

file1=/tmp/ips.log
file2=/tmp/ips-new.log
nginx_config_file=/etc/nginx/conf.d/real_ip_cloudflare.conf

/usr/local/bin/ip-docker.sh > "$file2"

echo "[REAL-IP] Init..." >> /tmp/cron.log

while [ ! -f "$nginx_config_file" ]; do
    sleep 10
    echo "[REAL-IP] Check init..." >> /tmp/cron.log
    /usr/local/bin/ip-docker.sh > "$nginx_config_file"
    echo "[REAL-IP] Loop..." >> /tmp/cron.log
done

if [ -f "$file1" ] && [ -f "$file2" ]
then
    diff "$file1" "$file2" > /dev/null
    if [ $? != 0 ]
    then
        echo "[REAL-IP] Update..." >> /tmp/cron.log
        /usr/local/bin/ip-docker.sh > "$nginx_config_file"
        /usr/local/bin/ip-docker.sh > "$file1"
        docker kill -s HUP "$NGINX_WEB_SEVICE_NAME"
    else
        echo "[REAL-IP] Up to date!" >> /tmp/cron.log
    fi
else
    echo "[REAL-IP] Init..." >> /tmp/cron.log
    /usr/local/bin/ip-docker.sh > "$nginx_config_file"
    /usr/local/bin/ip-docker.sh > "$file1"
    docker kill -s HUP "$NGINX_WEB_SEVICE_NAME"
fi



