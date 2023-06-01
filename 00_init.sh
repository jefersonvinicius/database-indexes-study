set -e

psql -U postgres -f /create-dbs.sql
psql -U postgres -d database_with_indexes -f /init-indexed-db.sql
psql -U postgres -d database_without_indexes -f /init-no-indexed-db.sql
psql -U postgres -d database_with_indexes -f /data.sql
psql -U postgres -d database_without_indexes -f /data.sql