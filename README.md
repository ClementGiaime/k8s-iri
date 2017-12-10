# k8s-iri
Projet lp iri 2017

## Principe
A l'aide d'un orchestrateur de conteneur, choisir une ou des applications à héberger sur le cluster, de préférence une application de type « web » ayant au moins besoin d’un serveur web (apache, nginx, ...) et d'un base de donnée (MySQL, PostgreSQL, ...) puis effectuer un compte rendu du projet.

## Theme de notre projet
Proposé aux développeurs de l'entreprise x des outils web afin de facilité le travail en équipe !

## Qu'est-ce-qui nous faut
* Logiciel de gestion de versions code décentralisée
* Logiciel de communication

## Solutions proposées
* Gestion de versions code
  * GitLab
  * Bitbucket ??
* Comunication
  * Rocket.Chat
  * Mattermost
  * TeamSpeak
## Link

* __Dockerfile :__
  * https://docs.docker.com/engine/reference/builder/#exec-form-entrypoint-example
* __GitBucket :__
  * https://hub.docker.com/r/f99aq8ove/gitbucket/
* __PostgreSQL :__
  * https://hackernoon.com/deploying-postgresql-on-kubernetes-7d00a9c5b874
  * https://www.xenonstack.com/blog/how-to-deploy-postgresql-on-kubernetes
  * https://www.guillaume-leduc.fr/le-stockage-distribue-avec-glusterfs.html
* __GlusterFS:__
  * http://docs.gluster.org/en/latest/Install-Guide/Install/
  * http://docs.gluster.org/en/latest/Install-Guide/Configure/
* __Docker Cleanup :__
  * https://www.calazan.com/docker-cleanup-commands/

## Docker cleanup

* __Kill all running containers :__
  * sudo docker kill $(sudo docker ps -q)
* __Delete all stopped containers (including data-only containers) :__
  * sudo docker rm $(sudo docker ps -a -q)
* __Delete all 'untagged/dangling' (<none>) images :__
  * sudo ocker rmi $(sudo docker images -q -f dangling=true)
* __Delete ALL images :__
  * sudo docker rmi $(sudo docker images -q)
  
## Dns for pod
### Pods
__A Records__
When enabled, pods are assigned a DNS A record in the form of pod-ip-address.my-namespace.pod.cluster.local.
For example, a pod with __IP 1.2.3.4__ in the namespace default with a DNS name of __cluster.local__ would have an entry: __1-2-3-4.default.pod.cluster.local__

