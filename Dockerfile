FROM debian:stretch
MAINTAINER onion007@gmail.com

RUN sed -i 's/deb.debian.org/mirrors.163.com/g' /etc/apt/sources.list && \
    sed -i 's/security.debian.org/mirrors.163.com/g' /etc/apt/sources.list

RUN apt update && apt -qy install shadowsocks-libev privoxy
ADD ROOT/* /
ADD ROOT/etc/privoxy/* /etc/privoxy/

EXPOSE 1080 8080

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/startup.sh"]
