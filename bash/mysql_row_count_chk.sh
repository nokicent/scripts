#!/bin/bash
HOST=$1
USER=$2
DATABASE=$4

export MYSQL_PWD=$3

mysql -h$HOST -u$USER $DATABASE -N -e "SELECT table_name FROM INFORMATION_SCHEMA.tables where table_schema='$DATABASE';" | while read -r table_name  
do
count=$(mysql -h$HOST -u$USER $DATABASE -N -e "SELECT COUNT(*) FROM $table_name;")
echo "$table_name: $count"
done
