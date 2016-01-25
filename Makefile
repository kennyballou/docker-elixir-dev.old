TAG=kennyballou/docker-elixir-dev
all: build
.PHONY: all

build: Dockerfile
	@docker build -t ${TAG} .

clean:
	@docker rmi ${TAG}
