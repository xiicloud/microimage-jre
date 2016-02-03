#!/bin/bash

set -e

docker rm -f "$CON_NAME" > /dev/null 2>&1 || true
docker run -d --name $CON_NAME $IMAGE sleep 1000

if [ ! -f /tmp/helloworld.jar ]; then
  wget -O /tmp/helloworld.jar.zip http://www.java2s.com/Code/JarDownload/helloworld/helloworld.jar.zip
  unzip /tmp/helloworld.jar.zip
fi

docker cp /tmp/helloworld.jar $CON_NAME:/app/
docker exec $CON_NAME java helloworld.jar|grep -i "Hello"

docker rm -f $CON_NAME

echo "---> The test pass"
