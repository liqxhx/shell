# pull.sh
```shell
#!/bin/bash
# 1. 配置好tomcat
# 2. 安装好git,maven，clone代码，切换到需要的分支
# 3. 修改以下配置

PROJECT_NAME=ifms

echo "1. 拉取分支：$PROJECT_NAME-release"
cd /usr/local/git/$PROJECT_NAME/
git pull
if [ $? -ne 0 ]; then
    echo "拉取分支失败：$PROJECT_NAME-develop"
fi
cd /usr/local/git/ifms/ifms-inte
/usr/local/maven-3.5.3/bin/mvn clean  install  -Dmaven.test.skip=true -e -P dev
if [ $? -ne 0 ]; then
    echo "打包失败"
fi
exit 0
```

# deploy.sh
```shell
#!/bin/bash
# 1. 在83服务器配置好tomcat
# 2. 在83服务器安装好git,maven，clone代码，切换到需要的分支
# 3. 修改以下配置,在/usr/local/git运行相应工程的脚本

TOMCAT_NAME=tomcat-inte-8080
PROJECT_NAME=ifms-inte
TOMCAT_PATH=/usr/local/$TOMCAT_NAME
WAR_PATH=/usr/local/git/$PROJECT_NAME.war



cd /usr/local/git
echo "1. 运行83服务器pull编译脚本"
ssh root@192.168.9.113 "/usr/local/git/pull-ifms-parent.sh"

echo "2. 从83服务器拷贝war包"
rm -rf $PROJECT_NAME.war
scp root@192.168.9.113:/usr/local/git/ifms/$PROJECT_NAME/target/$PROJECT_NAME.war $PROJECT_NAME.war


echo "3. 停止tomcat"
pid=`pgrep -f "$TOMCAT_NAME"`
if [ "$pid" != "" ]; then
    kill $pid
fi

echo "4. 替换war包"
rm -rf $TOMCAT_PATH/webapps/$PROJECT_NAME.war
cp -af $WAR_PATH $TOMCAT_PATH/webapps/
ls -lh $TOMCAT_PATH/webapps/

echo "5. 启动tomcat"
$TOMCAT_PATH/bin/startup.sh
tail -f $TOMCAT_PATH/logs/catalina.out
```
