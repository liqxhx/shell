#!/bin/sh
lock=./lock
spid=./application.pid  #存的进程pid
start(){
if [ -e $lock ]
then
        echo "..."
else
        echo "$0 ..."
        java -jar ./xxx.jar &
        touch $lock
fi
}
stop(){
if [ -e $lock ]
then
        pid=`cat $spid`
        kill -9 $pid
        rm -rf $lock
        sleep 2
        echo "$0 ......"
else
        echo "$0·..."
fi
}

status(){
if [ -e $lock ]
then
        echo "....."
else
        echo "$0·..."
fi
}

case "$1" in
"start")
start
;;
"stop")
stop
;;
"status")
status
;;
"restart")
stop
start
;;
*)
echo "?·¨:$0 start|stop|status|restart"
;;
esac
