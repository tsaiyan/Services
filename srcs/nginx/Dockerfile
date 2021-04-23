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
RUN apk add nginx openssl

# copies
COPY default /etc/nginx/conf.d/default.conf
COPY zdarova.jpg /var/www/localhost
COPY index.html /var/www/localhost

# ssl
RUN openssl req -x509 -out localhost.crt -keyout localhost.key -newkey rsa:2048 -nodes -sha256 -subj '/CN=medovar'
RUN mv localhost.crt /etc/nginx/ && mv localhost.key /etc/nginx/

# ports
EXPOSE 80 443

# start
CMD nginx -g 'daemon off;'
