#!/bin/bash


#HOME_K8S=$PWD
#echo $HOME_K8S

#ADD LABEL
kubectl label nodes node-1 TypeOfPod=gluster-1
kubectl label nodes node-2 TypeOfPod=gluster-2
kubectl label nodes node-2 TypeOfPod=g

#START POD GLUSTERFS
kubectl apply -f ./GlusterFS/glusterfs-1-pod.yml
kubectl apply -f ./GlusterFS/glusterfs-2-pod.yml
kubectl apply -f ./GlusterFS/glusterfs-all-service.yml

#START VOLUME GLUSTERFS
./GlusterFS/simple.sh

#START ROCKET.CHAT
kubectl apply -f Mongo/
kubectl apply -f Rocket.Chat/
