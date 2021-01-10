FROM debian:10

RUN set -x \
    && addgroup --system --gid 101 nginx \
    && adduser --system --disabled-login --ingroup nginx --no-create-home --home /nonexistent --gecos "nginx user" --shell /bin/false --uid 101 nginx

RUN apt-get update && apt-get install -y \
    nginx

COPY --chown=nginx:nginx ./prac.gfb.intra.crt /etc/ssl/certs/prac.gfb.intra.crt
COPY --chown=nginx:nginx ./prac.gfb.intra.key /etc/ssl/private/prac.gfb.intra.key
COPY --chown=nginx:nginx ./ssl.conf /etc/nginx/conf.d/ssl.conf

CMD ["nginx", "-g", "daemon off;"]
