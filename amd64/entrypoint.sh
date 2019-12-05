#!/bin/bash

mkdir -p /data/dnsdist/conf

if [ ! -f /data/dnsdist/conf/dnsdist.conf ]; then
	cp -pR /etc/dnsdist/* /data/dnsdist/conf/
fi


rm -Rf /etc/dnsdist

ln -s /data/dnsdist/conf /etc/dnsdist

BACKEND=`getent hosts bind | awk '{ print $1 }'`
echo "newServer(\"${BACKEND}\")" >> /etc/dnsdist/dnsdist.conf

/usr/bin/dnsdist -C /etc/dnsdist/dnsdist.conf -u _dnsdist -g _dnsdist --supervised

