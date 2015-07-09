#!/bin/bash
pushd `dirname $BASH_SOURCE` > /dev/null; HOME=`pwd`; popd > /dev/null
source $HOME/common.sh "$1"
SERVICE=haproxy
CURL=`which curl`
JQ=`which jq`
DATA=$($CURL -s $ENDPOINTS/$SERVICE|jq '.[] | select(."# pxname"=="admin")'|jq '. | select(."svname"=="FRONTEND")'|jq .status)

if [ $DATA == "\"OPEN\"" ]
then
	echo GREEN
	exit 0
else
	echo WARNING
	exit 1
fi

