#!/bin/sh

if [ -z $1 ]; then
    echo "Please provide database name"
    exit
fi

createlang plpgsql $1
psql -d $1 -f /usr/share/postgresql/9.1/contrib/postgis-2.0/postgis.sql
psql -d $1 -f /usr/share/postgresql/9.1/contrib/postgis-2.0/postgis_comments.sql
psql -d $1 -f /usr/share/postgresql/9.1/contrib/postgis-2.0/spatial_ref_sys.sql
psql -d $1 -f /usr/share/postgresql/9.1/contrib/postgis-2.0/legacy.sql
psql -d $1 -f /usr/share/postgresql/9.1/contrib/postgis-2.0/rtpostgis.sql

