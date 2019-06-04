#!/bin/sh
set -xe
v2dir=/v2ray-build/src/v2ray.com/core

docker_id=$(docker run -v $(pwd)/v2ray-core:${v2dir} shynome/v2ray-build //release:v2ray_darwin_amd64_package)
docker cp ${docker_id}:${v2dir}/bazel-bin/release/*.zip release/
