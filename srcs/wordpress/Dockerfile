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

# install nginx
RUN mkdir -p /run/nginx
RUN apk add nginx supervisor
COPY default /etc/nginx/conf.d/default.conf

# other installs
RUN apk add wget
COPY supervisor.conf /etc/
COPY wp-config.php /wordpress/

# php
RUN apk add php7 php7-fpm php7-cgi fcgi php7-mysqli php7-mbstring php7-json php7-session 

# for wp working
RUN apk add php7-common php7-session php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom 

# wp install
RUN wget http://wordpress.org/latest.tar.gz
RUN tar zxvf latest.tar.gz && rm latest.tar.gz


# ports
EXPOSE 5050

# run
CMD /usr/bin/supervisord -c /etc/supervisor.conf
