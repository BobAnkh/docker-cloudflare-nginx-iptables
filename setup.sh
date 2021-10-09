#!/bin/bash
###
 # @Author       : BobAnkh
 # @Github       : https://github.com/BobAnkh
 # @Date         : 2021-10-09 15:00:15
 # @LastEditors  : BobAnkh
 # @LastEditTime : 2021-10-09 15:23:03
 # @Description  : 
 # Copyright 2021 BobAnkh
### 

set -e

echo "Generate necessary certificates..."
mkdir -p ./data/certs && cd ./data/cert

openssl genrsa -out default.key 2048
openssl req -new -key default.key -out default.csr
openssl x509 -req -days 3650 -in default.csr -signkey default.key -out default.crt
rm default.csr
openssl dhparam -out dhparam.pem 4096

cd ../..
echo "done!"
