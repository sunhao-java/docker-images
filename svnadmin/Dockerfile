FROM tomcat

MAINTAINER Sun.Hao "sunhao.java@gmail.com"

# 删除原来的
RUN rm -rf /usr/local/tomcat/webapps/*

# 复制文件
ADD ./svnadmin.war /usr/local/tomcat/webapps/ROOT.war

# 设置时区
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# 设置apt-get的源
RUN { \
  echo 'deb http://mirrors.aliyun.com/debian/ stretch main non-free contrib'; \
  echo 'deb http://mirrors.aliyun.com/debian-security stretch/updates main'; \
  echo 'deb http://mirrors.aliyun.com/debian/ stretch-updates main non-free contrib'; \
  } > /etc/apt/sources.list.d/stretch.list;

# 安装svn
RUN apt-get update && apt-get install -y subversion subversion-tools

# 启动脚本
COPY ./run.sh /opt/
RUN chmod u+x /opt/run.sh

VOLUME [ "/var/opt/svn" ]
WORKDIR /var/opt/svn
EXPOSE 3690 8080
CMD [ "/opt/run.sh" ]