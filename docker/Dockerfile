FROM alpine

RUN apk update && apk add g++ pcre-dev openssl-dev zlib-dev make

ARG NGINX_VERSION
ARG NGINX_SOURCE_FILENAME
ARG NGINX_RTMP_SOURCE_FILENAME

WORKDIR nginx_src

COPY "$NGINX_SOURCE_FILENAME" .
COPY "$NGINX_RTMP_SOURCE_FILENAME" .

RUN tar -xf "$NGINX_SOURCE_FILENAME"
RUN unzip "$NGINX_RTMP_SOURCE_FILENAME"

WORKDIR "nginx-$NGINX_VERSION"
RUN ./configure --add-module=../nginx-rtmp-module-master && make && make install

COPY rtmp.conf /usr/local/nginx/conf/nginx.conf

CMD ["/usr/local/nginx/sbin/nginx", "-g", "daemon off;"]
