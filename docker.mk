# File: /kube-commands/Dockerfile
# Project: docker-openldap
# File Created: 24-06-2021 04:03:49
# Author: Clay Risser <email@clayrisser.com>
# -----
# Last Modified: 25-04-2022 13:44:50
# Modified By: Clay Risser <email@clayrisser.com>
# -----
# Risser Labs LLC (c) Copyright 2021
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

export TAG ?= latest
export CONTAINER_NAME ?= $(shell echo $(NAME) | $(SED) 's|\/|_|g')
export MAJOR := $(shell echo $(VERSION) | cut -d. -f1)
export MINOR := $(shell echo $(VERSION) | cut -d. -f2)
export PATCH := $(shell echo $(VERSION) | cut -d. -f3)

DOCKER_COMPOSE ?= docker-compose
DOCKER ?= docker

.PHONY: build
build:
	@$(DOCKER_COMPOSE) -f docker-build.yaml build $(ARGS)

.PHONY: pull
pull:
	@$(DOCKER_COMPOSE) -f docker-build.yaml pull $(ARGS)

.PHONY: push
push:
	@$(DOCKER_COMPOSE) -f docker-build.yaml push $(ARGS)

.PHONY: ssh
ssh:
	@($(DOCKER) ps | $(GREP) -E "$(NAME)$$" $(NOOUT)) && \
		$(DOCKER) exec -it $(NAME) /bin/sh || \
		$(DOCKER) run --rm -it --entrypoint /bin/sh $(IMAGE):$(TAG)

.PHONY: logs
logs:
	@$(DOCKER_COMPOSE) logs -f $(ARGS)

.PHONY: up
up:
	@$(DOCKER_COMPOSE) up $(ARGS)

.PHONY: stop
stop:
	@$(DOCKER_COMPOSE) stop $(ARGS)

.PHONY: clean
clean:
	-@$(DOCKER_COMPOSE) kill
	-@$(DOCKER_COMPOSE) down -v --remove-orphans
	-@$(DOCKER_COMPOSE) rm -v
