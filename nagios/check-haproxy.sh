#!/bin/bash
source ./common.sh "$1"
SERVICE=haproxy
CURL=`which curl`
JQ=`which curl`
# we use a lot of JQ to check if the "admin" frontend is up and open for business, this check can be copied for other services
DATA=$($CURL -s $ENDPOINTS/$SERVICE|jq '.[] | select(."# pxname"=="admin")'|jq '. | select(."svname"=="FRONTEND")'|jq .status)

if [ $DATA == "\"OPEN\"" ]
then
	echo GREEN
	exit 0
else
	echo WARNING
	exit 1
fi

