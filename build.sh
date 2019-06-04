#!/bin/sh
set -xe
v2dir=/v2ray-build/src/v2ray.com/core

exec docker run --rm -ti \
  -v $(pwd)/v2ray-core:${v2dir} \
  -v $(pwd)/release:${v2dir}/bazel-bin/release/ \
  shynome/v2ray-build //release:v2ray_linux_amd64_package
