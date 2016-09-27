FROM ubuntu

ADD consul-template /app/
ADD config.template /app/
COPY k2http /app/
WORKDIR /app

CMD ["./consul-template", "-consul", "consul",  "-template", "config.template:config.yml:./k2http --config config.yml" ]
