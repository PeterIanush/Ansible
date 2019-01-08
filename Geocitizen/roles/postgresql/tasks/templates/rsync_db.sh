#! /usr/bin/env bash
echo "1" | sudo -i ssh-copy-id -i /home/peter/.ssh/id_rsa.pub -o StrictHostKeyChecking=no peter@192.168.216.165
echo "1" | sudo PGPASSWORD=postgres -u postgres psql -c "select pg_start_backup('initial_backup');"
echo "1" | rsync -cva --inplace --exclude=*pg_xlog* /var/lib/postgresql/9.5/main/ 192.168.216.165:/var/lib/postgresql/9.5/main/
echo "1" | sudo PGPASSWORD=postgres -u postgres psql -c "select pg_stop_backup();"
