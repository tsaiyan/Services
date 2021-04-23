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
RUN apk add mysql mysql-client mariadb mariadb-common mariadb-client
COPY init.sh ./
RUN mkdir -p /run/mysqld/
COPY my.cnf /etc/
COPY wordpress.sql /
RUN chmod 777 /var/lib/mysql/

# ports
EXPOSE 3306

# start
CMD sh init.sh
