FROM ubuntu

RUN apt-get update && \
    apt-get install -y supervisor && \
    apt-get install -y python-pip && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean

RUN pip install j2cli

ADD k2http-supervisor.conf /etc/supervisor/conf.d/

ADD k2http /app/ 
ADD k2http_config.template /app/

ADD bootstrap.sh /app/

CMD ["/app/bootstrap.sh"]
