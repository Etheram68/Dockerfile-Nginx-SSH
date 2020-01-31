# Dockerfile-Nginx-SSH-php
This is a image whith nginx, php, and ssh on Alpine

## Commands
```
docker build -t server .  

docker run -it -p 80:80 -p 2222:22 -p 443:443 --name=server server:latest

ssh root@localhost -p 2222
```
