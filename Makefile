run: docker-compose.yml	 ./cse3461-server/Dockerfile ./cse3461-client/Dockerfile
	docker-compose up -d --build --remove-orphans
	docker exec -it lab_client_1 bash
