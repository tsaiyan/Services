FROM alpine:3.12

EXPOSE 8086

RUN apk update && apk upgrade
RUN apk add influxdb ca-certificates supervisor

RUN mkdir -p /run/influxdb
COPY supervisord.conf /etc/
RUN mkdir -p /var/lib/influxdb

RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
RUN wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.32-r0/glibc-2.32-r0.apk
RUN apk add glibc-2.32-r0.apk


RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.17.3_linux_amd64.tar.gz
RUN tar -zxvf telegraf-1.17.3_linux_amd64.tar.gz -C /
RUN cp -r telegraf-1.17.3/* / && rm telegraf-1.17.3_linux_amd64.tar.gz

RUN telegraf -sample-config --input-filter docker --output-filter influxdb > /etc/telegraf/telegraf.conf
RUN chmod +x /etc/supervisord.conf

VOLUME ["/var/lib/influxdb"]

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
#CMD ["sh"]