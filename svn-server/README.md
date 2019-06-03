apache2+svn+if.svnadmin

docker build -t tonychen/svn-server:v0.6 .

docker run -d  --name svn-server -p 82:80 -p 3960:3960 -v /opt/svn:/opt/svn  tonychen/svn-server:v0.6

-v /opt/svn:/opt/svn  目录外置到主机上