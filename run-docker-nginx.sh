#!/bin/bash

docker run --rm --name nginx \
    --add-host dockerhost:`ifconfig en0 | grep inet | grep -v inet6 | awk '{print \$2}'` \
    -v `pwd`/nginx/conf.d:/etc/nginx/conf.d \
    -v `pwd`/nginx/ssl:/etc/nginx/ssl \
    -p 80:80 \
    -p 443:443 \
    nginx