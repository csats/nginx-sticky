FROM debian:jessie

RUN apt-get update && apt-get install -y libssl1.0.0 curl ca-certificates && rm -rf /var/lib/apt/lists/*

RUN \
  mkdir -p /var/log/nginx && \
  ln -sf /dev/stdout /var/log/nginx/access.log && \
  ln -sf /dev/stderr /var/log/nginx/error.log

ADD nginx /usr/bin/nginx
ADD default.conf /etc/nginx/nginx.conf

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
