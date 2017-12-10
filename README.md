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

Dockerfile :
* https://docs.docker.com/engine/reference/builder/#exec-form-entrypoint-example
GitBucket :
* https://hub.docker.com/r/f99aq8ove/gitbucket/
PostgreSQL/
* https://hackernoon.com/deploying-postgresql-on-kubernetes-7d00a9c5b874
* https://www.xenonstack.com/blog/how-to-deploy-postgresql-on-kubernetes
* https://www.guillaume-leduc.fr/le-stockage-distribue-avec-glusterfs.html
GlusterFS:
* http://docs.gluster.org/en/latest/Install-Guide/Install/
* http://docs.gluster.org/en/latest/Install-Guide/Configure/

## Docker cleanup
Kill all running containers
* sudo docker kill $(sudo docker ps -q)
Delete all stopped containers (including data-only containers)
* sudo docker rm $(sudo docker ps -a -q)
Delete all 'untagged/dangling' (<none>) images
* sudo ocker rmi $(sudo docker images -q -f dangling=true)
Delete ALL images
* sudo docker rmi $(sudo docker images -q)
https://www.calazan.com/docker-cleanup-commands/

