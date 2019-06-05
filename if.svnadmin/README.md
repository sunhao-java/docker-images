1. 构建

        docker build -t com.lodsve/if.svnadmin:${tag} .

2. 使用
    - docker-compose.yml

          vim docker-compose.yml
          version: '3.1'
          services:
            if.svnadmin:
              image: com.lodsve/if.svnadmin:${tag}
              container_name: if.svnadmin
              restart: always
              network_mode: "bridge"
              ports:
                - "9018:80"
              volumes:
                - ${DOCKER_VOLUME}/if.svnadmin/svn:/opt/svn
                - ${DOCKER_VOLUME}/if.svnadmin/svnadmin-config:/var/www/localhost/htdocs/svnadmin/data/