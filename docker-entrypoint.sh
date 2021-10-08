#!/bin/bash
###
 # @Author       : BobAnkh
 # @Github       : https://github.com/BobAnkh
 # @Date         : 2021-10-08 13:23:31
 # @LastEditors  : BobAnkh
 # @LastEditTime : 2021-10-08 13:53:53
 # @Description  : 
 # Copyright 2021 BobAnkh
### 

echo "" >/usr/local/bin/iptables.sh

cp /etc/confd/configs/docker.toml /etc/confd/conf.d
ARGS="$ARGS -backend env"
if [[ $DEBUG -eq 1 ]]; then
  ARGS="$ARGS -log-level debug"
fi

echo "Starting confd in docker mode with args: $@ $ARGS"

# TODO - catch TERM/KILL signal and run `iptables.sh disable` before exiting

exec "$@" $ARGS
