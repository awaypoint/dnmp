#!/bin/sh
w=$(date +%w)
pwd='123456'
FilePath=/mnt/data/www/dnmp/data/mysql/
targetPath=/mnt/data/www/dnmp/backup
day=10
if [ $w -eq 2 ]
then
    for db in test
    do
        echo 'full'
        docker exec -it mysql mysqldump -uroot -p$pwd --quick --events  --databases $db --flush-logs --single-transaction > $targetPath/$db.sql
    done
else
   echo 'increase'
   docker exec -it mysql mysqladmin -uroot -p$pwd flush-logs
fi
find $FilePath -mtime +$day -name mysql-bin.\* -exec rm -rf {} \;