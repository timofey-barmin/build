#!/bin/bash

container_name=("cbdb")

for name in "${container_name[@]}"
    do
      container=$(docker ps -a | grep $name | awk -F\" '{ print $1 }')
      echo $container
      if [[ $container ]]
      then
          echo "Removing Docker container $container_name"
          docker rm -f $container_name
      fi
done


docker run -d -p 8091:8091 \
	--memory="50g" \
	--ulimit nofile=40960:40960 --ulimit core=1000000000:1000000000 --ulimit memlock=1000000000:1000000000 \
	--volume=/home/couchbase/buildboard-db:/opt/couchbase/var \
	--name=buildboard-db \
	couchbase/server

