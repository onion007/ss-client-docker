FROM shadowsocks/shadowsocks-libev
MAINTAINER onion007@gmail.com

USER root

# china repository
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories

RUN apk update && apk upgrade && apk add privoxy

ADD ROOT/* /
ADD ROOT/etc/privoxy/* /etc/privoxy/

EXPOSE 1080 8080

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/startup.sh"]
