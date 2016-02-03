#!/bin/bash

set -xe

docker rm -f "$CON_NAME" > /dev/null 2>&1 || true
docker run -d --name $CON_NAME $IMAGE sleep 1000

docker cp hello.jar $CON_NAME:/app/
docker exec $CON_NAME java hello.jar|grep -i "hello"

docker rm -f $CON_NAME

echo "---> The test pass"
