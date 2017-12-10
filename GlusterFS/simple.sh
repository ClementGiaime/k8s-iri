#!/bin/bash

function Check_return {
if [ $1 != 0 ]
then
  exit 1
fi
}



echo -n "All pod start  "
count=0
while [ $count != 2 ]
do
  sleep 1
  echo -n "-"
  count=0
  for i in `seq 1 2`
  do
    echo -n "-"
    get=`kubectl get pod -o wide | grep gluster-$i-pod`
    read name ready  status restarts age ip node <<< `echo $get`
    if [ "$status" = "Running" ] && [ "$ready" = "1/1" ]
    then
      let "count += 1"
    fi
  done
done
echo "> ok"

#Ip Address for Gluster-1
get=`kubectl get pod -o wide | grep gluster-1-pod`
read name ready  status restarts age ip node <<< `echo $get`
gluster1ip=$ip

#Ip Address for Gluster-2
get=`kubectl get pod -o wide | grep gluster-2-pod`
read name ready  status restarts age ip node <<< `echo $get`
gluster2ip=$ip


#Add resolv on /etc/hosts
kubectl exec -ti gluster-1-pod -- bash -c "echo $gluster2ip gluster-2-pod >> /etc/hosts"
kubectl exec -ti gluster-2-pod -- bash -c "echo $gluster1ip gluster-1-pod >> /etc/hosts"
kubectl exec -ti gluster-1-pod -- bash -c "gluster peer probe gluster-2-pod"
Check_return $?
kubectl exec -ti gluster-1-pod -- bash -c "gluster volume create gluster-fs-volume replica 2 gluster-1-pod:/srv/gluster gluster-2-pod:/srv/gluster force"
Check_return $?
kubectl exec -ti gluster-1-pod -- bash -c "gluster volume start gluster-fs-volume"
Check_return $?
