#!/bin/bash
CODE=$(curl -s -o /dev/null -w "%{http_code}" $CHECK_URL)
ONLINE=0
if [ "$CODE" == "200" ] ; then
    ONLINE=1
fi

SQL_DATE=$(date +%Y-%m-%d)
SQL_TIME=$(date +%H:%M:%S)

mysql -u$MYSQL_USER -p$MYSQL_PASSWORD --database=$MYSQL_DATABASE << EOF
INSERT INTO connectionstate (date, time, online) VALUES ('$SQL_DATE', '$SQL_TIME', $ONLINE);
EOF