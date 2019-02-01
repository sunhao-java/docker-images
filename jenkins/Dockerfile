FROM jenkins/jenkins:lts

USER root

RUN apt-get update && apt-get install -y make autoconf automake libtool && rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/stedolan/jq/releases/download/jq-1.6/jq-1.6.tar.gz && \
	tar -zxvf jq-1.6.tar.gz && \
    rm -rf jq-1.6.tar.gz && \
	cd jq-1.6 && \
	autoreconf -i && \
	./configure --disable-maintainer-mode && \
	make && \
	make install && \
    cd .. && \
    rm -rf jq-1.6
