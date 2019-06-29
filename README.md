# mq
MQ Server Docker Repository

This repo contains docker file of IBM MQ Server 9.1.x.

In the DockerFile

## Substitute the below <mqclient_user> with the user of the client which is going to connect with mq server
ARG user=<mqclient_user>

## Substitute the below <mqinstallation> with the name of the tar file of the mq installation (e.g. IBM_MQ_9.1_LINUX_X86-64_TRIAL.tar.gz)
ARG mqinstallation=<mqinstallation tar file name>

In the init.mqsc file

## Substitute the below with the user of the client which is going to connect with mq server
ALTER CHL(QMTEST.SVRCONN) CHLTYPE(SVRCONN) MCAUSER('<mqclient_user>')

## In the config.properties file add the values of the below properties
QM=
MCAUSER=
INSTALLATION=
