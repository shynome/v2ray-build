#!/bin/sh

exec docker build . -t shynome/v2ray-build --build-arg proxy='export HTTP_PROXY=http://192.168.1.184:1081 export HTTPS_PROXY=http://192.168.1.184:1081 export http_proxy=http://192.168.1.184:1081 export https_proxy=http://192.168.1.184:1081'
