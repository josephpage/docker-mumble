#Ubuntu 12.04 LTS system
FROM        ubuntu:12.04
ENV         DEBIAN_FRONTEND noninteractive
RUN         apt-get update
RUN         apt-get -y install mumble-server
# Port for mumble
EXPOSE      64738
ADD         ./mumble/mumble-server.ini /etc/mumble-server.ini
ADD         ./init/murmur.init /etc/init/murmur.init
RUN         service mumble-server start       