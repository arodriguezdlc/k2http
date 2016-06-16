#!/bin/bash 

function stage() {
	echo "###########################################"
	echo "# Stage: $*"
	echo "###########################################"
}

function docker_exec() {
	CONTAINER_NAME=$1
	COMMAND=$2
	CONTAINER_ID=$(docker ps | grep "$CONTAINER_NAME" | awk '{print $1}' )
	docker exec -i $CONTAINER_ID sh -c "$COMMAND"
}

function exit_test() {
	docker-compose down
	popd &> /dev/null
	exit $1
}

#SCRIPT=$(realpath $0)
#SCRIPTPATH=$(dirname $SCRIPT)
#pushd $SCRIPTPATH &> /dev/null
pushd testing &> /dev/null

###################################
#stage "Create k2http docker image"
###################################
#pushd .. &> /dev/null

###################################
#stage "Create n2kafka docker image"
###################################
#git clone  

#############################
stage "Create environment"
#############################
docker-compose up -d || exit_test 1

##############################
stage "Make integration tests"
##############################
docker_exec kafka-input "timeout 10 echo '{}' | /opt/kafka_*/bin/kafka-console-producer.sh --topic testing --broker-list 172.16.238.100:9092" || exit_test 1
docker_exec kafka-output "timeout 30 /opt/kafka_*/bin/kafka-console-consumer.sh --topic testing --zookeeper zookeeper-output:2181 --max-messages 1" || exit_test 1














popd &> /dev/null
