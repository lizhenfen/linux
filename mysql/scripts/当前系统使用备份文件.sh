#!/bin/bash
BACKUPDIR=/data/mysqlbackdir  #备份目录
MYSQLUSER=root
MYSQLPASS=jylm33
TODAY=`date +'%u'`            #周
EVERYDATA=`date +'%Y-%m-%d'`  #今天
LASTDAY=`date -d "-1 days" +"%Y-%m-%d"`  #昨天

#全备控制, 和判断备份是否成
function FullBackup(){
    `which innobackupex` --defaults-file=/etc/my.cnf --no-timestamp --user=$MYSQLUSER --password=$MYSQLPASS ${BACKUPDIR}/${EVERYDATA} &> "$BACKUPDIR/logs/$EVERYDATA".log
    BACKREVAL=$?
    if [ `tail -1  "$BACKUPDIR/logs/$EVERYDATA.log" | grep "OK!" | wc -l` -eq 1 ]
    then
        #应用备份
        `which innobackupex` --apply-log --redo-only "$BACKUPDIR/$EVERYDATA" &> /dev/null 
        REDOREVAL=$?
        [ "$BACKREVAL" -eq 0 -a "$REDOREVAL" -eq 0 ] && echo "backup sucess" &> /tmp/mysql.log
        REVAL=0       
    else
        REVAL=1 
    fi 
    return $REVAL     
}

function TestBaseDIR(){
    i=1
    while true
    do
        BASEDIR=`date -d "-$(($TODAY-1)) days" +"%Y-%m-%d"`
        if [ ! -d  "$BACKUPDIR/$BASEDIR" ]
        then
            BASEDIR=`date -d "-$(( ${TODAY} - $(( i-1 )) )) days" +"%Y-%m-%d"`
            break
        fi
    done
    return 0
}

#增备控制, 和判断备份是否成
function IncreaMentBackup(){
    LASTLSN=`grep "lsn"  $BACKUPDIR/logs/$LASTDAY.log 2>/dev/null | awk '{print $(NF-2)}' | tr -d "()" `
    [ "$?" -eq 0 -a -n "$LASTLSN" ] && (
    `which innobackupex` --no-timestamp --user=$MYSQLUSER --password=$MYSQLPASS --incremental "$BACKUPDIR/$EVERYDATA" --incremental-basedir="$BACKUPDIR/$LASTDAY" &> "$BACKUPDIR/logs/$EVERYDATA.log" 
    )
    BACKREVAL=$?
    # `which innobackupex` --stream=xbstream --no-timestamp --user=$MYSQLUSER --password=$MYSQLPASS --incremental "$BACKUPDIR/$EVERYDATA" --incremental-basedir="$BACKUPDIR/$LASTDAY" > "$BACKUPDIR/$EVERYDATA/$EVERYDATA.xbstream" 2>/dev/null2>/dev/null
    if [ `tail -1 "$BACKUPDIR/logs/$EVERYDATA.log" | grep "OK" 2>/dev/null | wc -l ` -eq 1 ] 
    then
        #此处找出周一, 或 第一次备份的目录
        #BASEDIR=`date -d "-$(($TODAY-1)) days" +"%Y-%m-%d"`
        TestBaseDIR
        if [ "$TODAY" -ne 7 ]   #周末
        then
        #应用备份
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

# 逻辑处理
if [ "$TODAY" -eq 1 -o ! -d "$BACKUPDIR" ]
then
    #周一或初次备份时, 进行全备
    [ -d "$BACKUPDIR/logs" ] || (mkdir -p "$BACKUPDIR/logs")
    [ $? -eq 0 ]  && FullBackup
    
else
    #周二到周日增量备份
    [ -d "$BACKUPDIR/$EVERYDATA" ] && (/bin/rm -rf "${BACKUPDIR}/${EVERYDATA}"; action "$BACKUPDIR/$EVERYDATA dir had removed" /bin/true) 
    IncreaMentBackup
    
fi

