#!/bin/bash
CODE=$(curl -s -o /dev/null -w "%{http_code}" $CHECK_URL)
ONLINE=0
if [ "$CODE" == "200" ] ; then
    ONLINE=1
fi

SQL_DATE_TIME=$(date +"%Y-%m-%d %H:%M:%S")

mysql -u$MYSQL_USER -p$MYSQL_PASSWORD --database=$MYSQL_DATABASE << EOF
INSERT INTO connectionstate (datetime, online) VALUES ('$SQL_DATE', $ONLINE);
EOF