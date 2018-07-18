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
