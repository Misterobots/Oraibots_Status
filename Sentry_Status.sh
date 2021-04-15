#!/bin/bash

SCRIPT_DIR=`cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P`
#INSYNC=`docker exec orai_node oraicli status | jq .sync_info | jq .catching_up`
INSYNC=`docker exec orai_node oraid status &> /tmp/status.json && cat /tmp/status.json | jq '.' | grep catching_up | grep "true"`

#if [ "${INSYNC}" == "true" ]
#if [[ ${INSYNC} == "false" ]]
if [[ -z ${INSYNC} ]]
then
	echo "`date` node is synced"
else
    echo "`date` ALARM! node is out of sync"
	 "${SCRIPT_DIR}/../sentry_alert.sh" "$HOSTNAME inform you:" "ALARM! Orai node is out of sync"  2>&1 > /dev/null
fi
