# docker-images
My customized docker image of some software


# 文件目录描述

```
├── jenkins [定制化jenkins镜像，增加了jq命令，能够解析json]
│   ├── Dockerfile [docker file]
│   └── docker-compose.yml [docker-compose启动脚本]
└── yapi [yapi的镜像]
    ├── Dockerfile [docker file]
    ├── config [示例配置文件]
    │   └── config.json [示例配置文件]
    └── docker-compose.yml [docker-compose启动脚本]
```