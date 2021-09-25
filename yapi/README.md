<h2 align="center">Docker for YApi</h2>
<p align="center">一键部署YApi</p>

## ⚠️注意
注意：本仓库目前只支持安装，暂不支持升级，请知晓。如需升级请备份mongoDB内的数据。

## 使用
默认密码是：`ymfe.org`，安装成功后进入后台修改

## 可修改变量
| 环境变量       | 默认值         | 描述         | 是否必填  |
| ------------- |:-------------:|:-----------:|:----------:|
| ADMIN_EMAIL | sunhao.java@gmail.com  | 默认管理员账号 | 否 |
| NOTIFY_UPGRADE | true  | 开启版本通知功能 | 否 |
| DISABLE_REGISTER | false  | 禁止用户注册 yapi 平台 | 否 |
| DB_HOST | -  | MongoDB地址 | <span style="color: red;"> (*) 是 </span> |
| DB_NAME | -  | 使用的数据库名称 | <span style="color: red;"> (*) 是 </span> |
| DB_PORT | - | MongoDB端口 | <span style="color: red;"> (*) 是 </span> |
| DB_USER | - | MongoDB用户名 | <span style="color: red;"> (*) 是 </span> |
| DB_PWD | - | MongoDB密码 | <span style="color: red;"> (*) 是 </span> |
| MAIL_ENABLE | false | 是否启用邮箱 | 否 |
| MAIL_HOST | - | 邮箱smtp地址 | 否 |
| MAIL_PORT | - | 邮箱smtp端口 | 否 |
| MAIL_FROM | - | 发件人 | 否 |
| MAIL_USER | - | 发件人账号 | 否 |
| MAIL_PWD | - | 发件人账号密码 | 否 |

## docker-compose 部署
docker-compose.yml
```
version: '2.1'
services:
  yapi:
    image: sunhaojava/yapi:1.9.2
    container_name: yapi
    restart: always
    volumes:
      - ./yapi.log:/home/vendors/log
    env_file:
      - .env
    ports:
      - "xxxx:3000"
```
.env
```
# yapi的工作目录
# 初始账号
ADMIN_EMAIL=sunhao.java@gmail.com
# 版本通知
NOTIFY_UPGRADE=true
# 禁止注册
DISABLE_REGISTER=true
# 数据库host
DB_HOST=xxxxx
# 数据库名
DB_NAME=yapi
# 数据库端口
DB_PORT=00000
# 数据库用户名
DB_USER=yapi
# 数据库密码
DB_PWD=yapi
# 是否启用邮箱
MAIL_ENABLE=true
# 邮箱smtp地址
MAIL_HOST=xxxxxx
# 邮箱smtp端口
MAIL_PORT=25
# 发件人
MAIL_FROM=xxx@xxx.com
# 发件人账号
MAIL_USER=xxx@xxx.com
# 发件人密码
MAIL_PWD=xxxxxx
```

## 启动方法
1. 启动服务：`docker-compose up -d`

## 如何构建镜像
1. `./build.sh 1.9.2`
2. 后面的参数是YAPI的版本号

## 如何找到该镜像
1. 我发布在docker-hub上
2. 地址[sunhaojava/yapi](https://hub.docker.com/r/sunhaojava/yapi)
3. get it via `docker pull sunhaojava/yapi`

## 其他
联系[@sunhao.java](mailto:sunhao.java@gmail.com)

欢迎 Star && Fork