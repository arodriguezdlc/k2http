#!/bin/bash

j2 /app/config.template > /app/config.yml

supervisord -n 
