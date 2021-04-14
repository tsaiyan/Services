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

#INSTALLS
RUN apk add sudo vim mysql mysql-client supervisor \
    openrc mariadb mariadb-common mariadb-client

COPY supervisor.conf /etc/supervisord.conf
COPY init.sh ./
RUN mkdir -p /run/mysqld/

#RUN INIT
COPY init.sh .

#CNF MYSQL
COPY my.cnf /etc/
COPY wordpress.sql /
RUN chmod 777 /var/lib/mysql/
RUN chmod +x init.sh

#PORTS
EXPOSE 3306

CMD sh init.sh
