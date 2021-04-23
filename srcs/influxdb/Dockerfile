#* ************************************************************************** *#
#*                                                                            *#
#*                                                        :::      ::::::::   *#
#*   ft_services                                         :+:      :+:    :+:  *#
#*                                                    +:+ +:+         +:+     *#
#*   By: tsaiyan <tsaiyan@42.fr>                    +#+  +:+       +#+        *#
#*                                                +#+#+#+#+#+   +#+           *#
#*                                                     #+#    #+#             *#
#*                                                    ###   ########.fr       *#
#*                                                                            *#
#* ************************************************************************** *#

# os
FROM alpine:3.12

# update
RUN apk update && apk upgrade

# installs
RUN apk add influxdb supervisor 
RUN mkdir -p /run/influxdb
COPY supervisor.conf /etc/
RUN mkdir -p /var/lib/influxdb

# glibc
RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
RUN wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.33-r0/glibc-2.33-r0.apk
RUN apk add glibc-2.33-r0.apk
RUN rm glibc-2.33-r0.apk

# telegraf
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.17.3_linux_amd64.tar.gz
RUN tar -zxvf telegraf-1.17.3_linux_amd64.tar.gz
RUN cp -r telegraf-1.17.3/* /
RUN rm -rf telegraf-1.17.3
RUN telegraf -sample-config --input-filter docker --output-filter influxdb > /etc/telegraf/telegraf.conf

# ports
EXPOSE 8086

# start
CMD /usr/bin/supervisord -c /etc/supervisor.conf
