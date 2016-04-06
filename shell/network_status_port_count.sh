#!/bin/bash
# can add shift to parse more params

var=$1

function local_port(){
  ss -an | awk '/^tcp/ { if($2 == "LISTEN"){ print $5}}' | awk -F: '{ print $NF}'
}
function local_status(){
    ss -an | awk '/^tcp/ {++S[$2]} END{for(i in S) print i,S[i]}'
}
function param(){
if [ $# -ne 1 ];then
  echo "Usage: $0 port"
  echo "Usage: $0 status"
  exit 1
fi
}
if [ "$var" == "port" ];then
  local_port | tr "\n" " ";echo 
elif [ "$var" == "status" ];then
  local_status
else
  param
fi


