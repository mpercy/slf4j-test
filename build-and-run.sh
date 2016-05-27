#!/bin/bash -xe

mvn package

echo WITHOUT EXTRA SLF4J
java -cp target/test-1.0-SNAPSHOT-jar-with-dependencies.jar test.App

echo WITH EXTRA SLF4J LOG4J JAR - SAME VERSION
wget http://central.maven.org/maven2/org/slf4j/slf4j-log4j12/1.7.21/slf4j-log4j12-1.7.21.jar
java -cp target/test-1.0-SNAPSHOT-jar-with-dependencies.jar:slf4j-log4j12-1.7.21.jar test.App

echo WITH EXTRA SLF4J LOG4J JAR - DIFFERENT VERSION
wget http://central.maven.org/maven2/org/slf4j/slf4j-log4j12/1.6.4/slf4j-log4j12-1.6.4.jar
java -cp target/test-1.0-SNAPSHOT-jar-with-dependencies.jar:slf4j-log4j12-1.6.4.jar test.App
