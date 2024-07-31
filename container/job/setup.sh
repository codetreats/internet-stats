#!/bin/bash
set -e

service mariadb start
echo "[PREPARE] Prepare DB"
mysql -uroot -p$MYSQL_ROOT_PASSWORD -e "CREATE DATABASE $MYSQL_DATABASE;"
mysql -uroot -p$MYSQL_ROOT_PASSWORD --database=$MYSQL_DATABASE -e "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
mysql -uroot -p$MYSQL_ROOT_PASSWORD --database=$MYSQL_DATABASE -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';"
mysql -uroot -p$MYSQL_ROOT_PASSWORD --database=$MYSQL_DATABASE -e "FLUSH PRIVILEGES;"

sleep 10

if [[ -f "/dumps/latest.sql" ]] ; then
  mysql -uroot -p$MYSQL_ROOT_PASSWORD --database=$MYSQL_DATABASE < "/dumps/latest.sql"
else
  mysql -uroot -p$MYSQL_ROOT_PASSWORD --database=$MYSQL_DATABASE < "/src/layout.sql"
fi
