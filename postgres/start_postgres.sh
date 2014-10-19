#!/bin/bash

set -e

NEW_POSTGRES_UID=$(ls -ld /var/lib/postgresql/9.3/main | awk '{print $3}')
usermod -u $NEW_POSTGRES_UID postgres
DATA_DIR=/var/lib/postgresql/9.3/main

if [ ! -d "$DATA_DIR" ]; then
  mkdir -p $DATA_DIR
fi

if [ ! "$(ls -A $DATA_DIR)" ]; then
  sudo -u postgres /usr/lib/postgresql/9.3/bin/initdb -D /var/lib/postgresql/9.3/main
fi

chown -R postgres:postgres /var/run/postgresql/
exec sudo -u postgres /usr/lib/postgresql/9.3/bin/postgres -D DATA_DIR -c config_file=/etc/postgresql/9.3/main/postgresql.conf
