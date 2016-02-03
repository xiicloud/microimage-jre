#!/bin/bash

set -xe

docker rm -f "$CON_NAME" > /dev/null 2>&1 || true
docker run -d --name $CON_NAME $IMAGE sleep 1000

docker cp Hello.class $CON_NAME:/app/
docker exec $CON_NAME java /app/Hello|grep -i "hello"

docker rm -f $CON_NAME

echo "---> The test pass"
