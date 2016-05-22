#!/bin/bash
#date: 2015/05/19
#必须是单实例
#默认备份已做REDO
#问题： 第一次运行时如果非周一，出现问题需要手动恢复； 从下次周一开始正常
#备份未压缩, 可自定时压缩,
BACKUPDIR=/data/mysqlbackdir  #备份目录
MYSQLUSER=root
MYSQLPASS=openstack
TODAY=`date +'%u'`            #周
EVERYDATA=`date +'%Y-%m-%d'`  #今天
LASTDAY=`date -d "-1 days" +"%Y-%m-%d"`  #昨天

#全备
function FullBackup(){
    `which innobackupex` --no-timestamp --user=$MYSQLUSER --password=$MYSQLPASS "$BACKUPDIR/$EVERYDATA" &> "$BACKUPDIR/logs/$EVERYDATA".log
    BACKREVAL=$?
    if [ `tail -1  "$BACKUPDIR/logs/$EVERYDATA.log" | grep "OK!" | wc -l` -eq 1 ]
    then
        `which innobackupex` --apply-log --redo-only "$BACKUPDIR/$EVERYDATA" &> /dev/null 
        REDOREVAL=$?
        [ "$BACKREVAL" -eq 0 -a "$REDOREVAL" -eq 0 ] && echo "backup sucess" &> /tmp/mysql.log
        REVAL=0       
    else
        REVAL=1 
    fi 
    return $REVAL     
}

function IncreaMentBackup(){
    LASTLSN=`grep "lsn"  $BACKUPDIR/logs/$LASTDAY.log 2>/dev/null | awk '{print $(NF-2)}' | tr -d "()" `
    [ "$?" -eq 0 -a -n "$LASTLSN" ] && (
    `which innobackupex` --no-timestamp --user=$MYSQLUSER --password=$MYSQLPASS --incremental "$BACKUPDIR/$EVERYDATA" --incremental-basedir="$BACKUPDIR/$LASTDAY" &> "$BACKUPDIR/logs/$EVERYDATA.log" 
    )
    BACKREVAL=$?
    # `which innobackupex` --stream=xbstream --no-timestamp --user=$MYSQLUSER --password=$MYSQLPASS --incremental "$BACKUPDIR/$EVERYDATA" --incremental-basedir="$BACKUPDIR/$LASTDAY" > "$BACKUPDIR/$EVERYDATA/$EVERYDATA.xbstream" 2>/dev/null2>/dev/null


    if [ `tail -1 "$BACKUPDIR/logs/$EVERYDATA.log" | grep "OK" 2>/dev/null | wc -l ` -eq 1 ] 
    then
        BASEDIR=`date -d "-$(($TODAY-1)) days" +"%Y-%m-%d"`
        if [ "$TODAY" -ne 7 ]
        then
            `which innobackupex` --apply-log --redo-only $BACKUPDIR/$BASEDIR --incremental-dir="$BACKUPDIR/$EVERYDATA" &>> /dev/null
            REDOREVAL=$?
            [ "$BACKREVAL" -eq 0 -a "$REDOREVAL" -eq 0 ] && echo "backup success" > /tmp/mysql.log
        else
            `which innobackupex` --apply-log  $BACKUPDIR/$BASEDIR --incremental-dir="$BACKUPDIR/$EVERYDATA" &>> /dev/null
            REDOREVAL=$?
            [ "$BACKREVAL" -eq 0 -a "$REDOREVAL" -eq 0 ] && echo "backup success" > /tmp/mysql.log
        fi
        REVAL=0  
    else    
        REVAL=1
    fi
    return $REVAL
}


if [ "$TODAY" -eq 1 -o ! -d "$BACKUPDIR" ]
then
    [ -d "$BACKUPDIR/logs" ] || (mkdir -p "$BACKUPDIR/logs")
    [ -d "$BACKUPDIR/$EVERYDATA" ]  && exit 0
    mkdir -p "$BACKUPDIR/$EVERYDATA" &>/dev/null
    [ $? -eq 0 ]  && FullBackup
    
else
    [ -d "$BACKUPDIR/$EVERYDATA" ] && (action "FULLBACKUPDIR exists" /bin/true) && exit 0 || (mkdir -p "$BACKUPDIR/$EVERYDATA" &>/dev/null)
    [ $? -eq 0 ]  && IncreaMentBackup
    
fi

