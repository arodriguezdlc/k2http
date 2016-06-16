FROM ubuntu

RUN apt-get update && \
    apt-get install -y supervisor && \
    apt-get install -y python-pip && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean

RUN pip install j2cli

ADD supervisor/k2http.conf /etc/supervisor/conf.d/

ADD ../k2http /app/ 
ADD templates/config.template /app/

ADD bootstrap.sh /app/

CMD ["/app/bootstrap.sh"]
