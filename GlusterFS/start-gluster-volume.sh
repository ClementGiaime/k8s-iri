#!/bin/bash
#kubectl exec -ti gluster-1-pod -- bash -c "ping gluster-2-pod"
echo -n "Nombre de pod GlusterFS : "
read number

#Test le nombre donné par l'utilisateur
if [[  $number != +([0-9]) ]]
then
   echo "Entrer un nombre"
   exit
fi

#Test pour Attendre que tout les pod soit en status Running
count=0
echo -n "All pod start  "
while [ $count != $number ]
do
  sleep 1
  echo -n "-"
  count=0
  for i in `seq 1 $number`
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



kubectl exec -ti gluster-1-pod -- bash -c "gluster peer probe "
kubectl exec -ti gluster-1-pod -- bash -c "gluster volume create gluster-fs-volume replica $number GFS-01:/srv/gluster GFS-02:/srv/gluster"
kubectl exec -ti gluster-1-pod -- bash -c "gluster volume start gluster-fs-volume"



#kubectl get pod/gluster-1-pod -o wide | grep gluster-1-pod | { read name1 ready1 status1 restarts1 age1 ip1 node1 ; echo $name1 $ready1 $status1 $restarts1 $age1 $ip1 $node1; }
#kubectl get pod/gluster-2-pod -o wide | grep gluster-2-pod | { read name2 ready2 status2 restarts2 age2 ip2 node2 ; echo $name2 $ready2 $status2 $restarts2 $age2 $ip2 $node2; }
#get=`kubectl get pod/gluster-1-pod -o wide | grep gluster-1-pod`
#read name1 ready1 status1 restarts1 age1 ip1 node1 <<< `echo $get` 
#echo $name1 $ready1 $status1 $restarts1 $age1 $ip1 $node1
