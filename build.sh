#!/bin/sh
set -xe
v2dir=/v2ray-build/src/v2ray.com/core

docker run -ti --name v2ray-build -v $(pwd)/v2ray-core:${v2dir} shynome/v2ray-build //release:v2ray_darwin_amd64_package
docker cp v2ray-build:${v2dir}/bazel-bin/release/*.zip release/
