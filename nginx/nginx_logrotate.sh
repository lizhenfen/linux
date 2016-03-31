#!/bin/bash
year=`date +%Y`
month=`date +%m`
day=`date -d "-1 day" +%d`
base_dir=/tmp
log_path=/usr/local/nginx/logs/access.log

([ -d ${base_dir}/$year ] || mkdir ${base_dir}/$year ) && cd ${base_dir}/$year
([ -d ${month} ] || mkdir ${month} ) && cd $month
/usr/bin/mv $log_path ${day}.log  2>/dev/null

