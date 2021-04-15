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

RUN mkdir -p /run/nginx
RUN apk add nginx openssl openssh supervisor
COPY init.sh .
COPY default /etc/nginx/conf.d/default.conf
COPY zdarova.jpg /var/www/localhost

COPY index.html /var/www/localhost
COPY supervisor.conf /etc/
RUN openssl req -x509 -out localhost.crt -keyout localhost.key -newkey rsa:2048 -nodes -sha256 -subj '/CN=medovar'
CMD sh init.sh

EXPOSE 80 443 22
