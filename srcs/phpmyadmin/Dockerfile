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

#NGINX INSTALL
RUN mkdir -p /run/nginx
RUN apk add nginx openssl supervisor
COPY default /etc/nginx/conf.d/default.conf



COPY supervisor.conf /etc/

#PHP && PHPMYADMIN INSTALLS
RUN apk add wget php7 php7-fpm php7-cgi fcgi php7-mysqli php7-mbstring php7-json php7-session 
RUN wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.4-all-languages.tar.gz
RUN tar zxvf phpMyAdmin-5.0.4-all-languages.tar.gz && rm phpMyAdmin-5.0.4-all-languages.tar.gz
RUN mv phpMyAdmin-5.0.4-all-languages phpmyadmin

#PORTS
EXPOSE 5000

#RUN INIT
COPY init.sh .
CMD sh init.sh
