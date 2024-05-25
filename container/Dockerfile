FROM codetreats/simple-pipeline:latest
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -q -y mariadb-server phpmyadmin
RUN echo "Include /etc/phpmyadmin/apache.conf" >> /etc/apache2/apache2.conf
COPY src /release/src
COPY src /debug/src

RUN ln -s /release/src /src 
RUN chmod +x /release/src/*
RUN chmod +x /debug/src/*

COPY scripts/prepare.sh /pipeline/src/prepare.sh
COPY scripts/job.sh /job/
COPY src/my.cnf /my.cnf

RUN rm -f /etc/mysql/my.cnf && mkdir -p /etc/mysql && ln -s /my.cnf /etc/mysql/my.cnf
RUN echo "*/5 * * * * root /trigger.sh" > /etc/cron.d/cronjob
CMD ["/start.sh"]
