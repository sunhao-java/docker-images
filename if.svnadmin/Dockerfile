# Alpine Linux with s6 service management
FROM smebberson/alpine-base

LABEL maintainer="sunhao.java@gmail.com"

ENV SVNADMIN_URL=https://nchc.dl.sourceforge.net/project/ifsvnadmin/svnadmin-1.6.2.zip

# Install Apache2 and other stuff needed to access svn via WebDav
RUN 	sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories &&\
	apk update &&\
	apk add --no-cache apache2 apache2-utils apache2-webdav mod_dav_svn php5-apache2 php5 php5-json php5-sqlite3 php5-curl php5-xml php5-ftp php5-mcrypt php5-gettext php5-zip  php5-zlib php5-calendar &&\
	# Install svn
	apk add --no-cache subversion  &&\
	wget -O /tmp/svnadmin.zip "$SVNADMIN_URL" &&\
	unzip /tmp/svnadmin.zip -d /var/www/localhost/htdocs/svnadmin/

RUN chown -R apache:apache /var/www/localhost/htdocs/svnadmin/

# Add WebDav configuration
ADD config/dav_svn.conf /etc/apache2/conf.d/dav_svn.conf

# Add services configurations
ADD apache/ /etc/services.d/apache/
ADD subversion/ /etc/services.d/subversion/

# Expose ports for http and custom protocol access
EXPOSE 80 443 3960
