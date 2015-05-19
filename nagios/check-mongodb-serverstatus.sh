#!/bin/bash
source ./common.sh
SERVICE=mongodb/serverStatus
CURL=`which curl`
JQ=`which curl`

# mongodb uses the field "ok" so that is our "success" field
DATA=$($CURL -s $ENDPOINTS/$SERVICE|jq .ok)

if [ $DATA -eq 1 ]
then
	echo GREEN
	exit 0
else
	echo WARNING
	exit 1
fi

