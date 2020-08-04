#!/bin/sh
w=$(date +%w)
FilePath=/mnt/data/www/dnmp/data/mysql/
targetPath=/mnt/data/www/dnmp/backup
day=10
if [ $w -eq 0 ]
then
    for db in test
    do
        echo 'full'
        #docker exec -it mysql mysqldump --quick --events  --databases $db --flush-logs --single-transaction > $targetPath/$db.sql
    done
else
   echo 'increase'
   docker exec -it mysql mysqladmin flush-logs
fi
find $FilePath -mtime +$day -name mysql-bin.\* -exec rm -rf {} \;