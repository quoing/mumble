FROM alpine:latest
MAINTAINER quoing_docker@mess.cz
ARG GIT_TAG=-1.3.0
RUN apk add --no-cache --virtual .bootstrap-deps wget ca-certificates
RUN URL="https://github.com/mumble-voip/mumble/releases/download/${GIT_TAG}/murmur-static_x86-${GIT_TAG}.tar.bz2" \
	&& wget -O /tmp/murmur.tar.bz2 $URL \
	&& mkdir -p /opt && cd /opt && tar -jxvf /tmp/murmur.tar.bz2 && rm /tmp/murmur.tar.bz2 && mv /opt/murmur-* /opt/mumble && cd - \
	&& apk del .bootstrap-deps
COPY assets/start.sh /
EXPOSE 64738/tcp 64738/udp
CMD ["/start.sh"]

