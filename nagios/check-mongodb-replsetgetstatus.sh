#!/bin/bash
# only use this script if using mongo replication, otherwise it will always fail
pushd `dirname $BASH_SOURCE` > /dev/null; HOME=`pwd`; popd > /dev/null
source $HOME/common.sh "$1"
SERVICE=mongodb/replSetGetStatus
CURL=`which curl`
JQ=`which jq`

DATA=$($CURL -s $ENDPOINTS/$SERVICE|jq .success)

if [ $DATA -eq 1 ]
then
	echo GREEN
	exit 0
else
	echo WARNING
	exit 1
fi

