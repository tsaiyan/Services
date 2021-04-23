#!/bin/sh
mariadb-install-db --user=root
mysqld --user=root & sleep 10
echo "CREATE DATABASE wordpress;" | mysql -u root -p --skip-password
mysql --user=root wordpress < wordpress.sql
echo "CREATE USER 'wp_admin' IDENTIFIED BY 'password';" | mysql -u root -p --skip-password
echo "GRANT ALL PRIVILEGES ON wordpress.* TO wp_admin;" | mysql -u root -p --skip-password
echo "FLUSH PRIVILEGES;" | mysql -u root -p --skip-password
/usr/share/mariadb/mysql.server stop
sleep 2
/usr/bin/mysqld_safe
sleep 2


