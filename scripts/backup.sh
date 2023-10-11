#!/bin/bash

# Backup db
docker exec bkp_db_mysql_5.7.42 /usr/bin/mysqldump -u root --password=root_password redmine > /home/pronetware/project/redmine-docker/backup/db/backup_db_redmine_`date +%Y-%m-%d_%H_%M`.sql

# Backup attachments file

rsync -a /home/pronetware/project/redmine-docker/app/data/redmine_data /home/pronetware/project/redmine-docker/backup/app_files
