#!/bin/sh

set -e


/usr/sbin/privoxy /etc/privoxy/config
ss-local -c ./config.json -v
