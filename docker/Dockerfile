FROM centos:latest

LABEL maintainer "Gaurav Agarwal <bharatmicrosystems@gmail.com>"
#Substitute the below <mqclient_user> with the user of the client which is going to connect with mq server
ARG user=<mqclient_user>
#Substitute the below <mqinstallation> with the name of the tar file of the mq installation (e.g. IBM_MQ_9.1_LINUX_X86-64_TRIAL.tar.gz)
ARG mqinstallation=<mqinstallation tar file name>

COPY $mqinstallation /tmp/$mqinstallation

RUN cd /tmp && tar -xvzf IBM_MQ_9.1_LINUX_X86-64_TRIAL.tar.gz
RUN cd /tmp/MQServer && ./mqlicense.sh -accept
RUN cd /tmp/MQServer && rpm -ivh MQSeriesRuntime-9.1.0-0.x86_64.rpm MQSeriesJava-9.1.0-0.x86_64.rpm MQSeriesJRE-9.1.0-0.x86_64.rpm MQSeriesServer-9.1.0-0.x86_64.rpm

EXPOSE  4414 7800 1414

COPY entrypoint.sh /tmp/entrypoint.sh
COPY init.mqsc /tmp/init.mqsc
COPY installmq.sh /tmp/installmq.sh
COPY uninstallmq.sh /tmp/uninstallmq.sh
COPY config.properties /tmp/config.properties
RUN chmod 777 /tmp/entrypoint.sh
RUN  /opt/mqm/bin/setmqinst -i -p /opt/mqm
RUN rm -rf /tmp/MQServer
RUN useradd --gid mqm $user
USER root

ENTRYPOINT ["/tmp/entrypoint.sh"]