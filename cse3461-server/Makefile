dev: docker-compose.yml Dockerfile
	docker-compose up --build -d

prod: run-prod

build-prod: docker-compose.yml Dockerfile
	docker build --target prod -t bitsplease-project4-prod .

run-prod: build-prod
	docker run -it -p 4567:4567 --volume $(shell pwd):/code bitsplease-project4-prod 

clean:
	docker rmi $(shell docker images --filter "dangling=true" -q --no-trunc) --force
	docker image prune --filter="dangling=true" --force
