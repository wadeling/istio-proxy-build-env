#!/bin/bash

docker_name=envoy_env
#docker_name=official_envoy_env
mount_opt="-v /root/go:/root/go"
docker_opt="-v /var/run/docker.sock:/var/run/docker.sock"

tag=proxy-1.5.x
imagename=wade23/istio-proxy-build-env

#official
#tag=b6c2bae5716a289fd68c45a6e5bc16979dbe69c5
#imagename=envoyproxy/envoy-build-ubuntu

num=`docker ps -a | grep -w ${docker_name} | wc -l `
echo "$docker_name num:$num"
if [ $num -eq 0 ];then
    docker run -it --privileged=true --name=$docker_name $mount_opt $docker_opt $imagename:$tag 
else
    #check docker status
    isexited=`docker ps -a | grep ${docker_name} | grep "Exited" | wc -l `
    if [ $isexited -ne 0 ];then
	echo "docker:$docker_name exited,restart it"
        docker restart  $docker_name 
    fi
    echo "enter docker"
    docker exec -it $docker_name bash 
fi
