#!/bin/bash
. /opt/mqm/bin/setmqenv -s
. /tmp/config.properties
dspmq -o installation
endmqm $QM
endmqlsr -m $QM
rpm -qa | grep MQSeries | xargs rpm -ev
rm -rf /var/mqm/* 
rm -rf /opt/mqm
#