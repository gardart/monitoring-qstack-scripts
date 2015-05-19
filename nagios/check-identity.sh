#!/bin/bash
source ./common.sh
SERVICE=identity
CURL=`which curl`
JQ=`which curl`

DATA=$($CURL -s $ENDPOINTS/$SERVICE|jq .success)

if [ $DATA -eq 1 ]
then
	echo GREEN
	exit 0
else
	echo WARNING
	exit 1
fi

