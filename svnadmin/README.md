# SvnAdmin
[https://github.com/sunhao-java/svnadmin](https://github.com/sunhao-java/svnadmin)

# 构建
1. 构建

        docker build -t svnadmin .
2. 编写docker-compose.yml

        version: '3.1'
        services:
          svnadmin-svn:
            image: svnadmin-svn
            container_name: svnadmin-svn
            restart: always
            network_mode: "bridge"
            ports:
              - "8888:8080"
              - "3690:3690"
            environment:
              SVN_ADMIN_DB: db
              SVN_ADMIN_INSTANCE: svnadmin
              SVN_ADMIN_USERNAME: root
              SVN_ADMIN_PASSWORD: 123456
            external_links:
              - mysql:db
            volumes:
              - ./data:/var/opt/svn
3. 运行
    
        docker-compose up -d
4. 访问

        http://ip:8888        

# Docker-Hub上的镜像

    sunhaojava/svnadmin:latest