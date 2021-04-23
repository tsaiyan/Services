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
RUN mkdir -p /run/nginx
RUN apk add nginx supervisor wget

# copies
COPY default /etc/nginx/conf.d/default.conf
COPY supervisor.conf /etc/

# php && pma installs
RUN apk add php7 php7-fpm php7-cgi fcgi php7-mysqli php7-mbstring php7-json php7-session 
RUN wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.4-all-languages.tar.gz
RUN tar zxvf phpMyAdmin-5.0.4-all-languages.tar.gz && rm phpMyAdmin-5.0.4-all-languages.tar.gz
RUN mv phpMyAdmin-5.0.4-all-languages phpmyadmin
COPY config.inc.php /phpmyadmin/

# ports
EXPOSE 5000

# start
CMD /usr/bin/supervisord -c /etc/supervisor.conf
