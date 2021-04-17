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

#update
RUN apk update && apk upgrade

#installs
RUN mkdir -p /run/nginx
RUN apk add nginx openssl supervisor

#copies
COPY init.sh .
COPY default /etc/nginx/conf.d/default.conf
COPY zdarova.jpg /var/www/localhost
COPY index.html /var/www/localhost
COPY supervisor.conf /etc/

#ssl
RUN openssl req -x509 -out localhost.crt -keyout localhost.key -newkey rsa:2048 -nodes -sha256 -subj '/CN=medovar'

#ports
EXPOSE 80 443

#init
CMD sh init.sh
