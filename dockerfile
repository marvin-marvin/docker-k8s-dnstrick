FROM ubuntu:latest 
RUN apt-get update -y && \
    apt-get install -y curl cron && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
ADD crontab /etc/cron.d/crontab
VOLUME /etc/cron.d
RUN touch /var/log/cron.log && /usr/bin/crontab /etc/cron.d/crontab && chmod 0644 /etc/cron.d/crontab
ENV TZ=Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
CMD ["cron", "-f"]
