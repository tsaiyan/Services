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
RUN apk add nginx openssl openssh wget supervisor

#PHP INSTALL
RUN apk add  php7 php7-fpm php7-opcache
RUN apk add php7-gd php7-mysqli php7-zlib php7-curl
COPY init.sh .
COPY default /etc/nginx/conf.d/default.conf
COPY supervisor.conf /etc/
RUN openssl req -x509 -out localhost.crt -keyout localhost.key -newkey rsa:2048 -nodes -sha256 -subj '/CN=medovar'
RUN mkdir -p /usr/share/webapps/
RUN cd /usr/share/webapps
RUN wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz
RUN tar zxvf phpMyAdmin-5.0.2-all-languages.tar.gz && rm phpMyAdmin-5.0.2-all-languages.tar.gz
RUN mv phpMyAdmin-5.0.2-all-languages phpmyadmin
RUN chmod -R 777 /usr/share/webapps/
RUN ln -s /usr/share/webapps/phpmyadmin/ /var/www/localhost/htdocs/phpmyadmin
CMD sh init.sh

EXPOSE 5000
