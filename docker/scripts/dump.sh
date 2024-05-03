#!/bin/bash

DATABASE=$1

if [ -z "$DATABASE" ]
then
    DATABASE="--all-databases"
fi

mariadb-dump $DATABASE -uroot -p"$MYSQL_ROOT_PASSWORD"
