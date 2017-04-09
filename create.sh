#!/bin/bash
##############################################################################
# 使用说明
# 前提条件已安装配置了jdk和maven
#
# chmod a+x create.sh

# 1)通过下面方式创建一个名为foo的maven项目
# ./create.sh foo
#
# 2)通过下面试创建一个多模块的maven项目，项目名为demo，下面有两个模块分别是foo和bar
# ./create.sh demo foo bar
#
##############################################################################
. tool
##############################################################################
LINE="--------------------------------------------------------"
log "create" "$LINE" "info"
log "create" "begin" "info"
log "create" "paramlen:$#" "info"
log "create" "params  :$*" "info"
log "create" "$LINE" "info"
##############################################################################

if [ $# = 0 ];then
    echo "ussage:./$0 [<project>|<module>]"
    exit 1
fi

##############################################################################

groupId="com.qhli.demo"
artifactId=${1}

cmd1="mvn archetype:generate -DgroupId=${groupId} -DartifactId=${artifactId} -DarchetypeGroupId=org.codehaus.mojo.archetypes -DarchetypeArtifactId=pom-root -DinteractiveMode=false -DarchetypeCatalog=local"
cmd2="mvn archetype:generate -DgroupId=${groupId} -DartifactId=${artifactId} -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false -DarchetypeCatalog=local"

##############################################################################

if [ $# = 1 ];then
    if [ -d "$artifactId" ];then
        log "create-maven-module" "$artifactId has aready exists." "error"
        log "create-maven-module" "$LINE" "info"
        exit 1
    fi
    log "create-maven-moudle" "$groupId:$artifactId"
    log "create-maven-module" "${cmd2}"
    eval "${cmd2}"
    log "create-maven-module" "create module:${groupId}:${artifactId} successful"
log "create" "$LINE" "info"
else # >= 2
    if [ -d "$artifactId" ];then
        log "create-maven-project" "project:$artifactId has aready exists." "error"
        log "create-maven-project" "$LINE" "info"
        exit 1
    fi
    log "create-maven-project" "$groupId:$artifactId"
    log "create-maven-project" "${cmd1}"
    eval "${cmd1}"
    log "create-maven-project" "create project:${groupId}:${artifactId} successful"
    log "create" "$LINE" "info"
    log "create-maven-project" "cd ${artifactId}"
    cd $artifactId
    log "create" "$LINE" "info"

    #shift
    while [ "$2" != "" ]
    do
        artifactId="$2"
        if [ -d "$artifactId" ];then
            log "create-maven-module" "module:$artifactId has aready exists." "error"
            log "create-maven-module" "$LINE" "info"
            exit 1
        fi
        log "create-maven-moudle" "${groupId}:${artifactId}"
        #这里要重新附值cmd2,否则cmd2中的artifactId不会被改变,不知道为什么，以后修改--------------xxxxxxxxxxx
        cmd2="mvn archetype:generate -DgroupId=${groupId} -DartifactId=${artifactId} -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false -DarchetypeCatalog=local"
        log "create-maven-module" "${cmd2}"
        eval "${cmd2}"
        log "create-maven-module" "create module:${groupId}:${artifactId} successful"
        shift
    done
fi
##############################################################################
log "create" "end" "info"
log "create" "$LINE" "info"
##############################################################################
