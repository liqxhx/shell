# 定义打印日志的前、后缀
LOG_PREFIX=$(date '+%Y-%m-%d %H:%M:%S')
LOG_SUFFIX="."

# 定义打印默认级别
LOG_LEVEL_DEFAULT="debug"
loglevel=${LOG_LEVEL_DEFAULT}

log(){
# [2017-03-02 22:10:10][debug][identity][msg][.]
    _level=${loglevel}
    if [ "$3" != ""  ]; then
    _level="$3"
    fi
    printf "[%s][%-5s][%-20s][%s][%s]\n" "${LOG_PREFIX}" "${_level}" "$1" "$2" "${LOG_SUFFIX}"

}
