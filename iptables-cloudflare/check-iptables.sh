#!/bin/bash
###
 # @Author       : BobAnkh
 # @Github       : https://github.com/BobAnkh
 # @Date         : 2021-10-08 16:43:42
 # @LastEditors  : BobAnkh
 # @LastEditTime : 2021-10-09 15:52:59
 # @Description  : 
 # Copyright 2021 BobAnkh
### 

# ipv4


file1=/tmp/iptables.log
file2=/tmp/iptables-new.log

echo "[IPTABLES] Init..." >> /tmp/cron.log
echo "[IPTABLES] Init ipv4..." >> /tmp/cron.log
/usr/local/bin/iptables-docker.sh > /tmp/iptables-new.log

if [ -f $file1 ] && [ -f $file2 ]
then
    diff $file1 $file2 > /dev/null
    if [ $? != 0 ]
    then
        echo "[IPTABLES-IPV4] Update..." >> /tmp/cron.log
        /usr/local/bin/iptables-docker.sh | /sbin/iptables-restore --counters
        /usr/local/bin/iptables-docker.sh > /tmp/iptables.log
    else
        echo "[IPTABLES-IPV4] Up to date!" >> /tmp/cron.log
    fi
else
    echo "[IPTABLES-IPV4] Init..." >> /tmp/cron.log
    /usr/local/bin/iptables-docker.sh | /sbin/iptables-restore --counters
    /usr/local/bin/iptables-docker.sh > /tmp/iptables.log
fi

# ipv6

file3=/tmp/ip6tables.log
file4=/tmp/ip6tables-new.log

echo "[IPTABLES] Init ipv6..." >> /tmp/cron.log
/usr/local/bin/iptables-dockerv6.sh > /tmp/ip6tables-new.log

if [ -f $file3 ] && [ -f $file4 ]
then
    diff $file3 $file4 > /dev/null
    if [ $? != 0 ]
    then
        echo "[IPTABLES-IPV6] Update..." >> /tmp/cron.log
        /usr/local/bin/iptables-dockerv6.sh | /sbin/ip6tables-restore --counters
        /usr/local/bin/iptables-dockerv6.sh > /tmp/ip6tables.log
    else
        echo "[IPTABLES-IPV6] Up to date!" >> /tmp/cron.log
    fi
else
    echo "[IPTABLES-IPV6] Init..." >> /tmp/cron.log
    /usr/local/bin/iptables-dockerv6.sh | /sbin/ip6tables-restore --counters
    /usr/local/bin/iptables-dockerv6.sh > /tmp/ip6tables.log
fi
