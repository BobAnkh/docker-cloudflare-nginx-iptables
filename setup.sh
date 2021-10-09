#!/bin/bash
###
 # @Author       : BobAnkh
 # @Github       : https://github.com/BobAnkh
 # @Date         : 2021-10-09 15:00:15
 # @LastEditors  : BobAnkh
 # @LastEditTime : 2021-10-09 15:26:12
 # @Description  : 
 # Copyright 2021 BobAnkh
### 

set -e

echo "Generate necessary certificates..."
mkdir -p ./data/certs && cd ./data/certs

openssl genrsa -out default.key 2048
openssl req -new -key default.key -out default.csr
openssl x509 -req -days 3650 -in default.csr -signkey default.key -out default.crt
rm default.csr
openssl dhparam -out dhparam.pem 4096

cd ../..
echo "done!"
echo "Please add your cloudflare origin certificates mannully for each website"
echo "in a format: example.com.crt and example.com.key"
