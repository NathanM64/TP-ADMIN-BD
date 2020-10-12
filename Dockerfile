FROM mysql:latest
RUN apt-get update && apt-get install cron -y && apt-get install logrotate -y && apt-get install vim -y

