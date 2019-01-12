FROM alpine:latest
MAINTAINER quoing_docker@mess.cz
RUN apk add --no-cache --virtual .bootstrap-deps wget ca-certificates
RUN URL=`wget -O- 'https://wiki.mumble.info/wiki/Main_Page' 2>/dev/null | tr -d '\n' | sed 's|.*\(https://github\.com/mumble-voip/mumble/releases/download/[0-9\.]*/murmur-static_x86-[0-9\.]*\.tar\.bz2\).*|\1|'` \
	&& wget -O /tmp/murmur.tar.bz2 $URL \
	&& mkdir -p /opt && cd /opt && tar -jxvf /tmp/murmur.tar.bz2 && rm /tmp/murmur.tar.bz2 && mv /opt/murmur-* /opt/mumble && cd - \
	&& apk del .bootstrap-deps
COPY assets/start.sh /
EXPOSE 64738/tcp 64738/udp
CMD ["/start.sh"]

