#Tail the kafka topic and see if it's listening to debezium postgres changes

docker run --tty --network postgres_debezium_cdc_master_default
confluentinc/cp-kafkacat kafkacat -b kafka: 9092 -C -s key=s -s value=avro -r
http:/schema-registry:8081 -t postgres.public.users