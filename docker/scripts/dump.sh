#!/bin/bash

mariadb-dump --all-databases -uroot -p"$MYSQL_ROOT_PASSWORD"
