#!/bin/bash

#####################################################################
#include file:tool in current directory, so we can invoke functions
. tool
# test
log "string.sh" "hello world"


#####################################################################
var=/aa/bb/cc

#####################################################################
#length
r1=${#var}

#match any characters when first meet /
r2=${var#*/}

#match any characters until last meet /
r3=${var##*/}

#match any characters when first meet / from last
r4=${var%/*}

#match any characters when first meet / from last
r5=${var%%/*}

#####################################################################
#9
echo '${#var}='$r1
#aa/bb/cc
echo '${var#*/}='$r2
#cc
echo '${var##*/}='$r3
#/aa/bb
echo '${var%/*}='$r4
#
echo '${var%%/*}='$r5
