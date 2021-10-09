#!/bin/sh
###
 # @Author       : BobAnkh
 # @Github       : https://github.com/BobAnkh
 # @Date         : 2021-10-08 13:23:31
 # @LastEditors  : BobAnkh
 # @LastEditTime : 2021-10-08 18:14:04
 # @Description  : 
 # Copyright 2021 BobAnkh
### 

set -e

/usr/local/bin/check-ip.sh
crond && tail -f /tmp/cron.log
