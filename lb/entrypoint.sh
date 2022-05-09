#!/bin/sh
set -e

service rsyslog start
cd /etc/haproxy
cp haproxy-normal.conf haproxy.cfg
service haproxy start
tail -f /var/log/haproxy.log



exec "$@"