FROM postgres:15.3

COPY init-indexed-db.sql /init-indexed-db.sql
COPY init-no-indexed-db.sql /init-no-indexed-db.sql
COPY data.sql /data.sql
COPY create-dbs.sql /create-dbs.sql
COPY 00_init.sh /docker-entrypoint-initdb.d/