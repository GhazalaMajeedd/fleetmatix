#!/bin/sh

if [ -z $1 ]; then
    echo "Please provide database name"
    exit
fi

psql -d $1 -f /usr/share/postgresql/9.1/contrib/postgis-1.5/uninstall_postgis.sql

