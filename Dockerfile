FROM ubuntu:trusty

RUN apt-get update && apt-get install -y nginx nginx-extras apache2-utils

VOLUME /webdav

EXPOSE 80

COPY webdav.conf /etc/nginx/conf.d/default.conf
RUN rm /etc/nginx/sites-enabled/*

COPY entrypoint.sh /usr/local/bin/entrypoint.sh

RUN chmod 777 /usr/local/bin/entrypoint.sh
#ENTRYPOINT [ "/bin/sh", "/usr/local/bin/entrypoint.sh" ]
CMD /bin/sh /usr/local/bin/entrypoint.sh && nginx -g "daemon off;"