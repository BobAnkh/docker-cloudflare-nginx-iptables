#!/bin/sh
###
 # @Author       : BobAnkh
 # @Github       : https://github.com/BobAnkh
 # @Date         : 2021-10-08 18:14:19
 # @LastEditors  : BobAnkh
 # @LastEditTime : 2021-10-08 18:27:57
 # @Description  : 
 # Copyright 2021 BobAnkh
### 

file1=/tmp/ips.log
file2=/tmp/ips-new.log
nginx_config_file=/etc/nginx/conf.d/real_ip_cloudflare.conf

/usr/local/bin/ip-docker.sh > $file2

if [ -f $file1 ] && [ -f $file2 ]
then
    diff $file1 $file2 > /dev/null
    if [ $? != 0 ]
    then
        echo "[NGINX] Update..." > /tmp/cron.log
        /usr/local/bin/ip-docker.sh > $nginx_config_file
        /usr/local/bin/ip-docker.sh > $file1
        nginx -t
        nginx -s reload
    else
        echo "[NGINX] Up to date!" > /tmp/cron.log
    fi
else
    echo "[NGINX] Init..." > /tmp/cron.log
    /usr/local/bin/ip-docker.sh > $nginx_config_file
    /usr/local/bin/ip-docker.sh > $file1
    nginx -t
    nginx -s reload
fi



