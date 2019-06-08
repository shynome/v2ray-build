#!/bin/sh
set -xe

V2CODE=${GOPATH}/code
V2DIR=${GOPATH}/src/v2ray.com/core

tar -cC ${V2CODE} . --exclude=vendor --exclude=bazel-* | tar -xC ${V2DIR}

if [ ! -d ${V2CODE}/vendor ]; then
  echo "need v2ray.com/core/vendor but not exsit"
  exit 1;
fi

tar -cC ${V2CODE}/vendor . | tar -xC ${GOPATH}/src 

$HOME/bin/bazel build --action_env=GOPATH=$GOPATH --action_env=PATH=$PATH $@

cp ${V2DIR}/bazel-bin/release/*.zip /v2ray-build/release/
