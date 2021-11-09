dev: 
	docker-compose up --build -d --remove-orphans

prod: build-prod run-prod

build-prod: Dockerfile 
	docker build --target prod -t cse3461-client-prod .

run-prod:
	docker run -it -e SERVER_HOSTNAME='server' -e SERVER_PORT='43110' --volume $(shell pwd):/code cse3461-client-prod

clean:
	docker rmi $(shell docker images --filter "dangling=true" -q --no-trunc) --force
	docker image prune --filter="dangling=true" --force
