#!/bin/sh
set -xe

V2DIR=${GOPATH}/src/v2ray.com/core

if [ ! -d ${V2DIR}/vendor ]; then
  echo "need v2ray.com/core/vendor but not exsit"
  exit 1;
fi

tar -cC ${V2DIR}/vendor . | tar -xC ${GOPATH}/src 

$HOME/bin/bazel build --action_env=GOPATH=$GOPATH --action_env=PATH=$PATH $@

cp ${V2DIR}/bazel-bin/release/*.zip /v2ray-build/release/
