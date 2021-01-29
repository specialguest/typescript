include .env
export $(shell sed 's/=.*//' .env)

DOCKER_COMPOSE      = docker-compose
NODE                = docker exec -it $(APP_NAME)-node
BUILDKIT            = COMPOSE_DOCKER_CLI_BUILD=1 DOCKER_BUILDKIT=1

ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

#### [ Docker 🐳 ]

build: ### build/rebuild images
	$(BUILDKIT) $(DOCKER_COMPOSE) build

build_no_cache: ### build/rebuild images
	$(BUILDKIT) $(DOCKER_COMPOSE) build  --no-cache

up: ## Start the docker hub
	$(BUILDKIT) $(DOCKER_COMPOSE) up -d

start: ## Starts existing containers for a service.
	$(DOCKER_COMPOSE) start

stop: ## Stops running containers without removing them.
	$(DOCKER_COMPOSE) stop

down: ## Stops containers and removes containers, networks, volumes, and images created by up.
	$(DOCKER_COMPOSE) down --remove-orphans

#### [ Node ]
node_install:
	$(BUILDKIT) $(NODE) yarn install

node_build:
	$(BUILDKIT) $(NODE) yarn build

#### [ Application deployment 🚀 ]

first_install:
	yarn install && yarn build

install: node_install node_build

#### [ Database 💽 ]

#### [ Tests Suite ✅ ]
#ci:



# docker run -it --rm --name my-running-script -v "$PWD":/usr/src/app -w /usr/src/app node:15.7.0-alpine3.10 yarn run build



