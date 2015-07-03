#!/bin/bash
pushd `dirname $BASH_SOURCE` > /dev/null; HOME=`pwd`; popd > /dev/null
source $HOME/common.sh "$1"
SERVICE=mysql
CURL=`which curl`
JQ=`which curl`

# if we get more than 1 in uptime, it means mysql is at least answering us and returning data
DATA=$($CURL -s $ENDPOINTS/$SERVICE|jq -r .UPTIME)

if [ $DATA -gt 1 ]
then
	echo GREEN
	exit 0
else
	echo WARNING
	exit 1
fi

