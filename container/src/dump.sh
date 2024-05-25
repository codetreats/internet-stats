#!/bin/bash
MONTH=$(date +"%Y-%m")
mysqldump -uroot -p$MYSQL_ROOT_PASSWORD $MYSQL_DATABASE > /dumps/latest.sql
if [[ -f /dumps/$MONTH.sql.tgz  ]] ; then
  exit
fi
tar -czf /dumps/$MONTH.sql.tgz /dumps/latest.sql 
