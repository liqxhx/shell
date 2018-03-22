# startDAL.sh
```
#!/bin/sh
echo $1
all="false"
if [ -z "$1" ] ; then
	all="true"
fi
echo $all

for id in 0 1 2 3 4 5 6
do

if [ $all = "true" ] ; then
	echo "all start dalMachine $id"
	`rm /opt/oss/ifms/dal${id}.log`
	eval "rm /opt/oss/ifms/dal${id}.log"
	eval "cd /opt/oss/ifms/DALMachine${id}"
	eval "nohup run.sh > /opt/oss/ifms/dal${id}.log 2>&1 &"
else
	if [ $1 = $id ] ; then
		echo "start dalMachine $id"
		eval "rm /opt/oss/ifms/dal${id}.log"
		eval "cd /opt/oss/ifms/DALMachine${id}"
		eval "nohup run.sh > /opt/oss/ifms/dal${id}.log 2>&1 &"
	fi
fi

done

```


# startAdapter.sh
```
#!/usr/bin/sh

IDENTIFY="ADAPTER-$1-$2"
rm -R $IDENTIFY
mkdir $IDENTIFY

CLASSPATH=.
CLASSPATH=./$IDENTIFY:$CLASSPATH

echo $IDENTIFY
pid=`ps -ef|grep $IDENTIFY|grep -v grep|grep -v tail|awk '{print $2}' `
if [ $pid ]; then
   echo "$pid"
   kill -9 $pid
   echo "$IDENTIFY is killed"
else
    echo "$IDENTIFY is not alive!"
fi




for file in `ls *.jar`
do
CLASSPATH=$CLASSPATH:./$file
done

for file in `ls dependency/*.jar`
do
CLASSPATH=$CLASSPATH:./$file
done

CLASSPATH=$CLASSPATH:./config
echo $CLASSPATH
rm *.class
rm *.java
echo "startAdapter $2 at " `date` >> startTime.log
nohup java -Xms64m -Xmx512m -server -classpath $CLASSPATH XXX.DalRMIAdapter $1 $2 > $2.log 2>&1 &

```

# run.sh 
```
#!/usr/bin/sh

IDENTIFY=DALMachine-0-
rm -R $IDENTIFY
mkdir $IDENTIFY

CLASSPATH=.
CLASSPATH=./$IDENTIFY:$CLASSPATH


pid=`ps -ef|grep $IDENTIFY|grep -v grep|grep -v tail|awk '{print $2}' `
if [ $pid ]; then
   kill -9 $pid
   echo "$pid"
   echo "$IDENTIFY is killed"
else
    echo "$IDENTIFY is not alive!"
fi




for file in `ls *.jar`
do
CLASSPATH=$CLASSPATH:./$file
done

for file in `ls dependency/*.jar`
do
CLASSPATH=$CLASSPATH:./$file
done
echo $CLASSPATH
CLASSPATH=$CLASSPATH:./config

rm *.class
rm *.java
echo "$IDENTIFY start at " `date` >> startTime.log
java -Xms64m -Xmx512m -server -classpath $CLASSPATH -XX:+UseGetTimeOfDay XXX.App

```

# run.bat
```
@echo off 
title="ODIManager"
setlocal enabledelayedexpansion 
set classpath=.
for %%c in (*.jar) do set classpath=!classpath!;%%c
for %%c in (dependency\*.jar) do set classpath=!classpath!;%%c
echo %classpath%
set classpath=config/;%classpath%

set JAVA_OPTS=-server -Xmx2048m -Xms2048m -Xmn768M -Xss128k -XX:ParallelGCThreads=20 -XX:+UseConcMarkSweepGC -XX:+UseParNewGC

%JAVA_HOME%\bin\java %JAVA_OPTS% -classpath %classpath% xxx.App
pause
```
# run.sh
```
#!/bin/bash

JAVA_OPTS=-server -Xmx4096m -Xms2048m -Xmn768M -Xss128k -XX:ParallelGCThreads=20 -XX:+UseConcMarkSweepGC -XX:+UseParNewGC -XX:-UseGCOverheadLimit

CLASSPATH=/usr/xxx/app
MYPATH=/usr/xxx/aaa

for file in `ls $MYPATH/*.jar`
do
CLASSPATH=$CLASSPATH:$file
done

for file in `ls $MYPATH/dependency/*.jar`
do
CLASSPATH=$CLASSPATH:$file
done

echo $CLASSPATH
CLASSPATH=$CLASSPATH:$MYPATH/config

#$JAVA_HOME/bin/java $JAVA_OPTS -classpath $CLASSPATH -DODIManager xxx.App $1

java $JAVA_OPTS -classpath $CLASSPATH -DXXX xxx.App $1

```
# run.sh
```
#!/usr/bin/sh

NLS_LANG=AMERICAN_AMERICA.ZHS32GB18030
export NLS_LANG

JAR_PATH=/opt/oss/ifms/dependency

IDENTIFY=AlarmRelationManager
rm -R $IDENTIFY
mkdir $IDENTIFY

CLASSPATH=.
CLASSPATH=./$IDENTIFY:$CLASSPATH


pid=`ps -ef|grep $IDENTIFY|grep -v grep|grep -v tail|awk '{print $2}' `
if [ $pid ]; then
   kill -9 $pid
   echo "$pid"
   echo "$IDENTIFY is killed"
else
    echo "$IDENTIFY is not alive!"
fi

for file in `ls *.jar`
do
CLASSPATH=$CLASSPATH:./$file
done

for file in `ls $JAR_PATH/*.jar`
do
CLASSPATH=$CLASSPATH:$file
done
echo $CLASSPATH
CLASSPATH=$CLASSPATH:./config

java -classpath $CLASSPATH -Xms2048M -Xmx2048M -XX:+AggressiveOpts -XX:+UseParallelGC -XX:MaxPermSize=256M -XX:NewSize=256M main.App

```
