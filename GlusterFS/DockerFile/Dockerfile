FROM ubuntu:16.04

ENV VERSION=3.10

RUN apt-get update && \
    apt-get install -y apt-utils python-software-properties software-properties-common && \
    add-apt-repository ppa:gluster/glusterfs-$VERSION && \
    apt-get update && \
    apt-get install -y glusterfs-server

EXPOSE 111 24007 24008 49152 49153
