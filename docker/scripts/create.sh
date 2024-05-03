#!/bin/bash

# Halt on error
set -e

DATABASE=$1

if [ -z "$DATABASE" ]
then
    echo "The database name is missing. Try again:"
    echo "> create.sh <database>"
    exit 1
fi

PASSWORD=`openssl rand -base64 16`
PASSWORD=${PASSWORD:0:16}

mariadb -uroot -p"$MYSQL_ROOT_PASSWORD" -e"CREATE USER '$DATABASE'@'%' IDENTIFIED BY '$PASSWORD';"
mariadb -uroot -p"$MYSQL_ROOT_PASSWORD" -e"CREATE DATABASE $DATABASE;"
mariadb -uroot -p"$MYSQL_ROOT_PASSWORD" -e"GRANT ALL PRIVILEGES ON $DATABASE.* TO '$DATABASE'@'%';"
mariadb -uroot -p"$MYSQL_ROOT_PASSWORD" -e"FLUSH PRIVILEGES;"

echo "New database $DATABASE created with password $PASSWORD." \
 | grep --color "^\|$DATABASE\|$PASSWORD"
