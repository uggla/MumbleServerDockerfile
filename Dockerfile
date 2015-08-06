FROM ubuntu:vivid
MAINTAINER uggla@free.fr
LABEL name=MumbleServer
LABEL version="1.0" description="Mumble Server in docker. Port used 64738 tcp and udp"
EXPOSE 64738 64738/udp
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
apt-get install -y apt-utils && \
apt-get install -y vim && \
apt-get install -y mumble-server
RUN useradd -k /etc/skel -m -s /bin/bash mumble 
COPY ./tmp/setup.sh /
COPY ./tmp/mumble-server.ini /etc/mumble-server.ini
RUN /setup.sh && rm /setup.sh
COPY ./config/docker-entrypoint.sh /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
