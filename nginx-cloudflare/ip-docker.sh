#!/bin/sh
###
 # @Author       : BobAnkh
 # @Github       : https://github.com/BobAnkh
 # @Date         : 2021-10-08 18:23:31
 # @LastEditors  : BobAnkh
 # @LastEditTime : 2021-10-08 18:23:31
 # @Description  : 
 # Copyright 2021 BobAnkh
### 

echo "# Cloudflare ip addresses"
echo ""
echo "# - IPv4"
for i in $(curl https://www.cloudflare.com/ips-v4); do
        echo "set_real_ip_from $i;"
done
echo ""
echo "# - IPv6"
for i in $(curl https://www.cloudflare.com/ips-v6); do
        echo "set_real_ip_from $i;"
done
echo ""
echo "real_ip_header X-Forwarded-For;"
