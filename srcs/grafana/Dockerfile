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
RUN apk add wget

# grafana
RUN wget https://dl.grafana.com/enterprise/release/grafana-enterprise-7.5.4.linux-amd64.tar.gz
RUN tar -zxvf grafana-enterprise-7.5.4.linux-amd64.tar.gz
RUN mv grafana-7.5.4 grafana
RUN rm grafana-enterprise-7.5.4.linux-amd64.tar.gz
RUN ln -s grafana/bin/grafana-server ./grafana-server
COPY grafana.db /grafana/data/grafana.db

# glibc
RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
RUN wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.33-r0/glibc-2.33-r0.apk
RUN apk add glibc-2.33-r0.apk
RUN rm glibc-2.33-r0.apk

# ports
EXPOSE 3000

# start
CMD ./grafana-server -config "grafana/conf/defaults.ini" -homepath "/grafana"
