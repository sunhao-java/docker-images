FROM php:7.1-apache

MAINTAINER Sun.Hao "sunhao.java@gmail.com"

ENV KODEXPLORER_VERSION=4.39
ENV KODEXPLORER_URL="https://github.com/kalcaddle/KodExplorer/archive/4.39.tar.gz"

RUN set -x \
  && mkdir -p /usr/src/kodexplorer \
  && apt-get update && apt-get install -y --no-install-recommends ca-certificates wget && rm -rf /var/lib/apt/lists/* \
  && wget -O /tmp/kodexplorer.tar.gz "$KODEXPLORER_URL" \
  && tar -xzf /tmp/kodexplorer.tar.gz -C /usr/src/kodexplorer/ --strip-components=1 \
  && apt-get purge -y --auto-remove ca-certificates wget \
  && rm -rf /var/cache/apk/* \
  && rm -rf /tmp/*

RUN set -x \
  && apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng-dev \
  && docker-php-ext-install -j$(nproc) iconv mcrypt \
  && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
  && docker-php-ext-install -j$(nproc) gd \
  && rm -rf /var/cache/apk/*

# 删除镜像中的这两个文件夹
RUN mv /usr/src/kodexplorer/data /usr/src/kodexplorer/data_bak \
  && mv /usr/src/kodexplorer/config /usr/src/kodexplorer/config_bak

WORKDIR /var/www/html

COPY entrypoint.sh /opt/shell/
RUN chmod u+x /opt/shell/entrypoint.sh

EXPOSE 80

ENTRYPOINT ["/opt/shell/entrypoint.sh"]

# 挂载文件
VOLUME  /var/www/html/data
VOLUME  /var/www/html/config

CMD ["apache2-foreground"] 
