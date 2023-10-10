FROM mysql:5.7.43

RUN yum -y update && yum -y install cronie tzdata

COPY ./scripts/db_backup.sh /usr/local/bin/db_backup.sh

RUN chmod +x /usr/local/bin/db_backup.sh

RUN echo "0 2 * * * root /usr/local/bin/db_backup.sh" > /etc/cron.d/db_backup_cron

RUN chmod 0644 /etc/cron.d/db_backup_cron

CMD ["mysqld"]
