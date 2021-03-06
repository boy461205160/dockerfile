#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail

ALPINE_VERSION=latest
OPENJDK_VERSION=8
#ORACLE_JDK_VERSION=8
TOMCAT_VERSION=8
MAVEN_VERSION=3.5.2-jdk-8

HUB_URL=172.31.21.226/ideal

cd alpine
docker build -t $HUB_URL/alpine:${ALPINE_VERSION} .
docker push $HUB_URL/alpine:${ALPINE_VERSION}

cd ../java/alpine/openjdk/8
docker build -t $HUB_URL/alpine-openjdk:${OPENJDK_VERSION} .
docker push $HUB_URL/alpine-openjdk:${OPENJDK_VERSION}

#cd ../java/alpine/oracle/8
#docker build -t $HUB_URL/alpine-jdk:${ORACLE_JDK_VERSION} .
#docker push $HUB_URL/alpine-jdk:${ORACLE_JDK_VERSION}

cd ../../../../tomcat
docker build -t $HUB_URL/tomcat:${TOMCAT_VERSION} .
docker push $HUB_URL/tomcat:${TOMCAT_VERSION}

cd ../maven
docker build -t $HUB_URL/maven:${MAVEN_VERSION} .
docker push $HUB_URL/maven:${MAVEN_VERSION}
