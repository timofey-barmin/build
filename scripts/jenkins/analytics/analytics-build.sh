#!/bin/bash -ex

cd "${WORKSPACE}/asterixdb"
mvn clean install -DskipTests
mv asterixdb/asterix-server/target/*.zip ${WORKSPACE}
