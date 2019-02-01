FROM ubuntu:16.04

# add user group, user and make user home dir
RUN groupadd --gid 1000 yapi && \
    useradd --uid 1000 --gid yapi --shell /bin/bash --create-home yapi

# set pwd to yapi home dir
WORKDIR /home/yapi

# install dependencies
RUN apt-get update && \
    apt-get install --no-install-recommends -y \
    build-essential \
    python \
    wget \
    git \
    apt-transport-https \
    ca-certificates

# install nodejs
RUN wget http://cdn.npm.taobao.org/dist/node/v8.9.0/node-v8.9.0-linux-x64.tar.gz && \
    tar -xzvf node-v8.9.0-linux-x64.tar.gz && \
    ln -s /home/yapi/node-v8.9.0-linux-x64/bin/node /usr/local/bin/node && \
    ln -s /home/yapi/node-v8.9.0-linux-x64/bin/npm /usr/local/bin/npm && \
    npm install -g cnpm --registry=https://registry.npm.taobao.org && \
    ln -s /home/yapi/node-v8.9.0-linux-x64/bin/cnpm /usr/local/bin/cnpm

# 创建日志文件夹
RUN mkdir -p /home/yapi/log

# 修改所有者
RUN chown -R yapi:yapi /home/yapi/log

# 创建挂载点（这个挂载点是不允许在主机上显示设置挂载的，默认会自动挂载在/var/lib/docker/volumes/container_id/_data目录下）
VOLUME ["/home/yapi/log"]

# 切换用户
USER yapi

# 下载源码文件
RUN wget https://github.com/YMFE/yapi/archive/1.4.4.tar.gz -O yapi.tar.gz && \
    tar -xzvf yapi.tar.gz -C yapi --strip-components 1

# npm install dependencies and run build
WORKDIR /home/yapi/yapi

RUN cnpm install
