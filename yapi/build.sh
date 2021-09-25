#! /bin/bash
# yapi的版本号
YAPI_VERSION=$1

docker build -t sunhaojava/yapi:${YAPI_VERSION} --build-arg YAPI_VERSION=${YAPI_VERSION} .