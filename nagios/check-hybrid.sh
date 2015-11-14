#!/bin/bash
pushd `dirname $BASH_SOURCE` > /dev/null; HOME=`pwd`; popd > /dev/null
source $HOME/common.sh "$1"
SERVICE=hybrid
CURL=`which curl`
JQ=`which jq`


DATA=$($CURL -s $ENDPOINTS/$SERVICE|jq .success)

if [ $DATA -eq 1 ]
then
	echo OK
	exit 0
else
	echo CRITICAL
	exit 2
fi

