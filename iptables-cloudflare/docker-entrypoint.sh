#!/bin/bash
###
 # @Author       : BobAnkh
 # @Github       : https://github.com/BobAnkh
 # @Date         : 2021-10-08 13:23:31
 # @LastEditors  : BobAnkh
 # @LastEditTime : 2021-10-08 16:52:24
 # @Description  : 
 # Copyright 2021 BobAnkh
### 

set -e

# /usr/local/bin/iptables-docker.sh | /sbin/iptables-restore --counters
# iptables -L -n -v -t mangle

# /usr/local/bin/iptables-dockerv6.sh | /sbin/ip6tables-restore --counters
# ip6tables -L -n -v -t mangle

cron && tail -f /dev/null
