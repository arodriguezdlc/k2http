#!/bin/bash

j2 /app/k2http_config.template > /app/config.yml

supervisord -n 
