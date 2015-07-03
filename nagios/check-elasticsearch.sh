#!/bin/bash
pushd `dirname $BASH_SOURCE` > /dev/null; HOME=`pwd`; popd > /dev/null
source $HOME/common.sh "$1"
SERVICE=elasticsearch
CURL=`which curl`
JQ=`which curl`

# ES data is relayed so "success" is named "status" there
# es also uses colors instead of 1 or 0
DATA=$($CURL -s $ENDPOINTS/$SERVICE|jq -r .status)

if [ $DATA == "green" ]
then
	echo GREEN
	exit 0
else
	echo WARNING
	exit 1
fi

