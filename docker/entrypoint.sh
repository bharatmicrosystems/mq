#!/bin/bash
. /tmp/config.properties
monitor()
{
	echo "----------------------------------------"
	echo "Running - stop container to exit"
	# Loop forever by default - container must be stopped manually.
	# Here is where you can add in conditions controlling when your container will exit - e.g. check for existence of specific processes stopping or errors being reported
	while true; do
		sleep 1
	done
}
if test -f "/var/mqm/mqs.ini"; then
    echo "file exist"
else
    echo "File does not exist"
    . /tmp/uninstallmq.sh
    . /tmp/installmq.sh
fi
su - mqm << block
crtmqm $QM
strmqm $QM
runmqsc $QM</tmp/init.mqsc
setmqaut -m $QM -t qmgr -p $MCAUSER +allmqi
block
trap stop SIGTERM SIGINT
monitor