#!/bin/bash

# Halt on error
set -e

DATABASE=$1

if [ -z "$DATABASE" ]
then
    echo "The database name is missing. Try again:"
    echo "> drop.sh <database>"
    exit 1
fi

mariadb -uroot -p"$MYSQL_ROOT_PASSWORD" -e"DROP DATABASE $DATABASE;"
mariadb -uroot -p"$MYSQL_ROOT_PASSWORD" -e"DROP USER '$DATABASE'@'%';"
mariadb -uroot -p"$MYSQL_ROOT_PASSWORD" -e"FLUSH PRIVILEGES;"

echo "The database $DATABASE was dropped." \
 | grep --color "^\|$DATABASE"
