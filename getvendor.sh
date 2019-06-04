#!/bin/sh
set -xe

docker run -ti --rm --name v2ray-build \
  -v $(pwd)/v2ray-core:${v2dir} \
  -e GOPATH=/tmp \
  --entrypoint go \
  shynome/v2ray-build \
  mod vendor
