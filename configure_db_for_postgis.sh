#!/bin/sh

POSTGRES_VERSION=9.1
POSTGIS_VERSION=2.0

if [ -z $1 ]; then
    echo "Syntax:\n\t $0 dbname [postgres_version] [postgis_version]\n\nExample:\n\t $0 fleetmatix 9.1 2.0"
    exit
fi

if [ -n $2 ]; then
    POSTGRES_VERSION=$2
fi

if [ -n $3 ]; then
    POSTGIS_VERSION=$3
fi

echo $POSTGRES_VERSION
echo $POSTGIS_VERSION

createlang plpgsql $1
psql -d $1 -f /usr/share/postgresql/$POSTGRES_VERSION/contrib/postgis-$POSTGIS_VERSION/postgis.sql
psql -d $1 -f /usr/share/postgresql/$POSTGRES_VERSION/contrib/postgis-$POSTGIS_VERSION/postgis_comments.sql
psql -d $1 -f /usr/share/postgresql/$POSTGRES_VERSION/contrib/postgis-$POSTGIS_VERSION/spatial_ref_sys.sql
psql -d $1 -f /usr/share/postgresql/$POSTGRES_VERSION/contrib/postgis-$POSTGIS_VERSION/legacy.sql
psql -d $1 -f /usr/share/postgresql/$POSTGRES_VERSION/contrib/postgis-$POSTGIS_VERSION/rtpostgis.sql

