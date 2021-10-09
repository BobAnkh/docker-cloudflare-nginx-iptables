#!/bin/bash
###
 # @Author       : BobAnkh
 # @Github       : https://github.com/BobAnkh
 # @Date         : 2021-10-09 15:00:15
 # @LastEditors  : BobAnkh
 # @LastEditTime : 2021-10-09 15:29:52
 # @Description  : 
 # Copyright 2021 BobAnkh
### 

set -e

echo "Copy .env file from sample"
cp .env.sample .env

echo "Update nginx.tmpl..."
DEFAULT_NGINX_TEMPLATE_URL="https://raw.githubusercontent.com/nginx-proxy/nginx-proxy/master/nginx.tmpl"
curl -L "$DEFAULT_NGINX_TEMPLATE_URL" -o nginx.tmpl

echo "Generate necessary certificates..."
mkdir -p ./data/certs && cd ./data/certs

openssl genrsa -out default.key 2048
openssl req -new -key default.key -out default.csr
openssl x509 -req -days 3650 -in default.csr -signkey default.key -out default.crt
rm default.csr
openssl dhparam -out dhparam.pem 4096

cd ../..
echo "Done!"
echo "Please add your cloudflare origin certificates mannully for each website"
echo "in a format: example.com.crt and example.com.key"
