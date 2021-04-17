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

RUN apk add vim wget openrc vsftpd vim openssl supervisor sudo

# ssl
#RUN openssl req -x509 -newkey rsa:2048 -nodes -sha256 -subj '/CN=medovar' -keyout /etc/ssl/private/vsftpd.key -out /etc/ssl/certs/vsftpd.crt

# copies
COPY vsftpd.conf /etc/vsftpd/
COPY supervisor.conf /etc/supervisord.conf

# add user
RUN mkdir -p /etc/ftps/admin
RUN adduser -D admin && echo "admin:password" | chpasswd

# ssl

RUN sudo mkdir -p /etc/ssl/private
RUN openssl req -x509 -nodes -days 10 -subj "/C=RU/ST=Kazan/L=Kazan/O=21/OU=21School/CN=localhost" \
    -newkey rsa:1024 -keyout /etc/ssl/private/pure-ftpd.pem -out /etc/ssl/private/pure-ftpd.pem

EXPOSE 21 20 2077

COPY init.sh .
CMD sh init.sh
