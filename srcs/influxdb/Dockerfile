#* ************************************************************************** *#
#*                                                                            *#
#*                                                        :::      ::::::::   *#
#*   ft_server                                           :+:      :+:    :+:  *#
#*                                                    +:+ +:+         +:+     *#
#*   By: tsaiyan <tsaiyan@42.fr>                    +#+  +:+       +#+        *#
#*                                                +#+#+#+#+#+   +#+           *#
#*   Created: 2020/10/31 14:37:58 by tsaiyan           #+#    #+#             *#
#*   Updated: 2020/10/31 14:38:00 by tsaiyan          ###   ########.fr       *#
#*                                                                            *#
#* ************************************************************************** *#

FROM alpine:3.12

RUN apk update && apk upgrade

# installs

RUN apk add vim wget openrc supervisor sudo

# influxdb install
RUN apk add influxdb

# volume
VOLUME	["var/lib/influxdb"]

# copies
COPY supervisor.conf /etc/supervisord.conf
#COPY influxdb.conf /etc/

EXPOSE 8086

COPY init.sh .
CMD sh init.sh
