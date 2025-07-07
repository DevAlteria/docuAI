NAME=iaDoc

$(NAME):
	@less README.md

all: $(NAME) 

clean: down
	# rm -rf ${PWD}/envs/dev/data/ollama-data-vol
	sudo rm -rf ${PWD}/envs/dev/data/n8n-data-vol
	sudo rm -rf ${PWD}/envs/dev/data/webui-data-vol

build:
	mkdir -p ${PWD}/envs/dev/data/ollama-data-vol
	mkdir -p ${PWD}/envs/dev/data/n8n-data-vol
	mkdir -p ${PWD}/envs/dev/data/webui-data-vol
	docker compose -f ./envs/dev/docker-compose.yml pull --ignore-buildable
	docker compose -f ./envs/dev/docker-compose.yml build

logs:
	docker compose -f ./envs/dev/docker-compose.yml logs

ps:
	docker compose -f ./envs/dev/docker-compose.yml ps

down:
	docker compose -f ./envs/dev/docker-compose.yml down

up:
	docker compose -f ./envs/dev/docker-compose.yml up -d

re: build down up
	@echo http://iadoc.alteria.vpn.alonsom.com/

prod:
	echo TODO
