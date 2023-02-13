# File: /shared.mk
# Project: images
# File Created: 15-04-2022 06:16:26
# Author: Clay Risser <email@clayrisser.com>
# -----
# Last Modified: 13-02-2023 02:16:33
# Modified By: Clay Risser <email@clayrisser.com>
# -----
# Risser Labs LLC (c) Copyright 2021 - 2022
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

export REGISTRY ?= registry.gitlab.com/risserlabs/community/docker-sway
export DOCKER_FLAVOR ?= docker

export X11DOCKER ?= x11docker

DESKTOP_ARGS := $(ARGS)
ifneq (,$(WAYLAND_DISPLAY))
DESKTOP_ARGS += --weston
endif

.PHONY: desktop
desktop:
	@$(X11DOCKER) $(DESKTOP_ARGS) $(IMAGE)

.PHONY: vnc
vnc:
	@$(DOCKER) run -it --rm \
		--user admin \
        -p 5910:5910 \
        -p 7023:7023 \
		$(IMAGE)
