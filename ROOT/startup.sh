#!/bin/bash

set -e

if [ -z "$SERVER_IP" ]; then
   echo >&2 'error: ss SERVER_IP option is not specified '
   echo >&2 '  You need to specify ss SERVER_IP'
   exit 188
else
   sed -i "s/SERVER_IP/${SERVER_IP}/" /ss.json
fi

if [ -z "$SERVER_PORT" ]; then
   echo >&2 'error: ss SERVER_PORT option is not specified '
   echo >&2 '  You need to specify ss SERVER_PORT'
   exit 188
else
   sed -i "s/SERVER_PORT/${SERVER_PORT}/" /ss.json
fi

if [ -z "$PASSWORD" ]; then
   echo >&2 'error: ss PASSWORD option is not specified '
   echo >&2 '  You need to specify ss PASSWORD'
   exit 188
else
   sed -i "s/PASSWORD/${PASSWORD}/" /ss.json
fi

if [ -z "$METHOD" ]; then
   echo >&2 'error: ss METHOD option is not specified '
   echo >&2 '  You need to specify ss METHOD'
   exit 188
else
   sed -i "s/METHOD/${METHOD}/" /ss.json
fi

/usr/sbin/privoxy /etc/privoxy/config
ss-local -c /ss.json --acl /proxy.list -v
