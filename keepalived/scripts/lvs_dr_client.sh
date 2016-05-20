#!/bin/bash
#keepalived 服务器上暂时不支持
. /etc/init.d/functions

VIP="192.168.56.11"

usage(){
  echo "Usage: $0 [start|stop|restart]"
}
start(){
    if [ `ip a | grep $VIP | wc -l` -eq 1 -o `ip route | grep "$VIP" | wc -l` -eq 1 ] 
    then
       action "vip setted " /bin/false 
       REVAL=0
    else
        echo 2 > /proc/sys/net/ipv4/conf/lo/arp_announce
        echo 1 > /proc/sys/net/ipv4/conf/lo/arp_ignore
        echo 1 > /proc/sys/net/ipv4/conf/all/arp_ignore
        echo 2 > /proc/sys/net/ipv4/conf/all/arp_announce
        ip addr add dev lo:0 $VIP && ip route add $VIP dev lo:0
        REVAL=$?
        [ "$REVAL" -eq 0 ] && action "vip setting" /bin/true
    fi
    return $REVAL
}
stop(){
    if [ `ip a | grep $VIP | wc -l` -eq 1 -o `ip route | grep "$VIP" | wc -l` -eq 1 ] 
    then
        echo 0 > /proc/sys/net/ipv4/conf/lo/arp_announce
        echo 0 > /proc/sys/net/ipv4/conf/lo/arp_ignore
        echo 0 > /proc/sys/net/ipv4/conf/all/arp_ignore
        echo 0 > /proc/sys/net/ipv4/conf/all/arp_announce
        ip addr del dev lo:0 $VIP/32 && ip route del $VIP dev lo:0
        REVAL=$?
        [ "$REVAL" -eq 0 ] && action "vip unsetting" /bin/true
       
    else
        action "vip setted " /bin/false 
        REVAL=0
    fi
    return $REVAL

}
restart(){
    stop
    start
}

case "$1" in
  start)
    start
    ;;
  stop)
    stop
    ;;
  restart)
    stop
    start
    ;;
  *)
    usage
    ;;
esac
