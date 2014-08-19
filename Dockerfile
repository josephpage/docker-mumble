FROM ubuntu:14.04

RUN apt-get update && \
	DEBIAN_FRONTEND=noninteractive apt-get -y install \
    	mumble-server \
    	pwgen \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 64738  # Default port for mumble
EXPOSE 64738/udp   # enable UDP for better reliabity
ADD ./mumble/mumble-server.ini /etc/mumble-server.ini
ADD ./init/murmur.init /etc/init/murmur.init
ADD ./scripts/start /start
RUN mkdir /data && \
	chown mumble-server:mumble-server /data && \
	chmod +x /start

VOLUME ["/data"]
USER mumble-server
CMD ["/start"]
