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

re: clean build up
	@echo http://iadoc.alteria.vpn.alonsom.com/

n8n-export-workflows:
	docker exec n8n rm -rf ./exports
	docker exec n8n mkdir ./exports
	docker exec n8n n8n export:workflow --separate --all --output ./exports --pretty
	docker cp n8n:/home/node/exports ./src/n8n/workflows/.
	for f in src/n8n/workflows/exports/*;  do MA_VAR=$$(cat $$f | jq .name | tr -d '"'); cp $$f "./src/n8n/workflows/$$MA_VAR.json" ; done
	rm -rf src/n8n/workflows/exports
	docker exec n8n rm -rf ./exports

n8n-export-credentials:
	docker exec n8n rm -rf ./exports
	docker exec n8n mkdir ./exports
	docker exec n8n n8n export:credentials --separate --all --output ./exports --pretty --decrypted
	docker cp n8n:/home/node/exports ./src/n8n/credentials/.
	for f in src/n8n/credentials/exports/*;  do MA_VAR=$$(cat $$f | jq .name | tr -d '"'); cp $$f "./src/n8n/credentials/$$MA_VAR.json" ; done
	rm -rf src/n8n/credentials/exports
	docker exec n8n rm -rf ./exports


prod:
	echo TODO
