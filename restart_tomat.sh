#!/bin/sh
TOMCAT_PATH=/home/server/shichuan/bin

echo "TOMCAT_PATH is $TOMCAT_PATH"

PID=`ps aux | grep /home/server/shichuan/ | grep java | awk '{print $2}'`

if [ -n "$PID" ]; then
    echo "Will shutdown tomcat: $PID"
    $TOMCAT_PATH/shutdown.sh -force
    sleep 5
else echo "No Tomcat Process $PID"
fi

ps -ef|grep -v grep|grep /home/server/shichuan/ | grep java |awk '{print "kill -9 "$2}'|sh
sleep 1

$TOMCAT_PATH/startup.sh

sleep 50

for((i=1;i<5;i++))
do
    LASTINFO=`tail -n 1 /home/server/shichuan/logs/catalina.out |grep 'INFO: Server startup in'`
    if [ -n "$LASTINFO" ]; then
        break
    else
        ps -ef|grep -v grep|grep /home/server/shichuan/ | grep java |awk '{print "kill -9 "$2}'|sh
        sleep 1
        $TOMCAT_PATH/startup.sh
        sleep 50
    fi
done