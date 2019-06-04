FROM ubuntu:16.04 as Build
ARG proxy=''
ENV \
  PATH=/root/go/bin:${PATH} \
  BAZEL_VER='0.23.0'
RUN set -e \
  && if [ ! -z "${proxy}" ];then \
    sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list && \
    sed -i 's/security.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list;fi \
  && apt-get -y update && apt-get -y install jq git file pkg-config zip g++ zlib1g-dev unzip python openssl curl \
  && ${proxy} \
  && curl -sL https://dl.google.com/go/go1.12.5.linux-amd64.tar.gz | tar -xzv -C ~ \
  && curl -L -o bazel-installer.sh https://github.com/bazelbuild/bazel/releases/download/${BAZEL_VER}/bazel-${BAZEL_VER}-installer-linux-x86_64.sh \
  && chmod +x bazel-installer.sh \
  && ./bazel-installer.sh --user && rm ./bazel-installer.sh 

ENV GOPATH=/v2ray-build
COPY docker-entrypoint.sh /docker-entrypoint.sh
WORKDIR /v2ray-build/src/v2ray.com/core
ENTRYPOINT [ "sh","/docker-entrypoint.sh" ]
CMD [ "//release:all" ]


