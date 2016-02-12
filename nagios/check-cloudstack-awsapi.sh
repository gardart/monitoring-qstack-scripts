#!/bin/bash
pushd `dirname $BASH_SOURCE` > /dev/null; HOME=`pwd`; popd > /dev/null
source $HOME/common.sh "$1"

file="/var/log/cloudstack/awsapi/awsapi.log"
current=`date +%s`
last_modified=`stat -c "%Y" $file`
if [ $(($current-$last_modified)) -gt 180 ]; then
    echo "WARNING";
    exit 1
else
    echo "GREEN";
    exit 0
fi
