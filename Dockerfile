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

FROM alpine:3.13

RUN apk update && apk upgrade

RUN mkdir -p /run/nginx
RUN apk add nginx openssl
COPY /srcs/init.sh .
COPY /srcs/default /etc/nginx/conf.d/default.conf
RUN openssl req -x509 -out localhost.crt -keyout localhost.key -newkey rsa:2048 -nodes -sha256 -subj '/CN=medovar'
CMD sh init.sh

EXPOSE 80 443
