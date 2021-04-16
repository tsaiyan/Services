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

COPY supervisor.conf /etc/

#INSTALLS

RUN apk add vim wget openrc vsftpd vim openssl
RUN openssl req -x509 -out localhost.crt -keyout localhost.key -newkey rsa:2048 -nodes -sha256 -subj '/CN=medovar' -newkey rsa:1024 -keyout /etc/ssl/private/pure-ftpd.pem -out /etc/ssl/private/pure-ftpd.pem
COPY vsftpd.conf /etc/vsftpd/
RUN adduser -D user && echo "user:pass" | chpasswd
#PORTS
EXPOSE 21 20

#INIT
COPY init.sh .
CMD sh init.sh
