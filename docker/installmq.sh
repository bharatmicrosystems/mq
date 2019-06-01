#!/bin/bash
. /tmp/config.properties
cd /tmp && tar -xvzf $INSTALLATION
rm -rf /tmp/$INSTALLATION
cd /tmp/MQServer && ./mqlicense.sh -accept
cd /tmp/MQServer && rpm -ivh MQSeriesRuntime-9.1.0-0.x86_64.rpm MQSeriesJava-9.1.0-0.x86_64.rpm MQSeriesJRE-9.1.0-0.x86_64.rpm MQSeriesServer-9.1.0-0.x86_64.rpm
/opt/mqm/bin/setmqinst -i -p /opt/mqm
rm -rf /tmp/MQServer
useradd  --gid mqm $MCAUSER
#