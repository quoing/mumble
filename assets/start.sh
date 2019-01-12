#!/bin/sh
echo "Starting..."

if [ ! -f /etc/mumble/mumble.ini ]; then
	# mumble.ini doesn't exist.. create one and exit
	echo "Copying mumble.ini to volume, please edit to your needs and restart container."
	[ ! -d /etc/mumble ] && mkdir -p /etc/mumble
	cp /opt/mumble/murmur.ini /etc/mumble/mumble.ini
	exit 1
fi

[ ! -d /data ] && mkdir /data

/opt/mumble/murmur.x86 -ini /etc/mumble/mumble.ini -fg

