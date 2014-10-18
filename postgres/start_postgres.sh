#!/bin/bash

set -e

NEW_POSTGRES_UID=$(ls -ld /var/lib/postgresql/9.3/main | awk '{print $3}')
usermod -u $NEW_POSTGRES_UID postgres

sudo -u postgres /usr/lib/postgresql/9.3/bin/initdb -D /var/lib/postgresql/9.3/main

chown -R postgres:postgres /var/run/postgresql/
sudo -u postgres /usr/lib/postgresql/9.3/bin/postgres -D /var/lib/postgresql/9.3/main -c config_file=/etc/postgresql/9.3/main/postgresql.conf
