#!/bin/bash
start_time=$(date +%s)
status=
elapsed=0
port=80
base=http://localhost
url=/

while [ $elapsed -lt 14400 ]
do
    end_time=$(date +%s)
    elapsed=$(( end_time - start_time ))
    echo -ne '\rTime: '$elapsed'  Status: '"$status"
    status=$(curl -s -o /dev/null -w "%{http_code}" $base:$port$url)
    [ "$status" != 200 ] && echo -e "\rNon-200 found: ""$status"
done

