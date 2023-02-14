# File: /ui.vision/Makefile
# Project: ci-images
# File Created: 06-10-2021 14:23:56
# Author: Clay Risser <email@clayrisser.com>
# -----
# Last Modified: 14-02-2023 13:02:45
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

include ../mkpm.mk
ifneq (,$(MKPM_READY))
include $(MKPM)/gnu
include $(PROJECT_ROOT)/shared.mk

export NAME ?= ui.vision
export VERSION ?= 0.0.1

include $(MKPM)/docker

CONTAINER ?= $(shell $(DOCKER) ps | $(GREP) $(NAME) | $(HEAD) -n1 | $(CUT) -d' ' -f1)

.PHONY: commit
commit:
	@[ "$(CONTAINER)" != "" ] && ( \
		$(DOCKER) commit $(CONTAINER) ${IMAGE}:latest && \
		$(DOCKER) tag ${IMAGE}:${TAG} ${IMAGE}:${MAJOR} && \
		$(DOCKER) tag ${IMAGE}:${TAG} ${IMAGE}:${MAJOR}.${MINOR} && \
		$(DOCKER) tag ${IMAGE}:${TAG} ${IMAGE}:${MAJOR}.${MINOR}.${PATCH} \
	) || echo "No container to commit"

endif
