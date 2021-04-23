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
RUN apk add wget vsftpd openssl

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

# ports
EXPOSE 21 2077

# start
CMD vsftpd /etc/vsftpd/vsftpd.conf
