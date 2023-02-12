# File: /Makefile
# Project: ci-images
# File Created: 15-08-2021 02:20:14
# Author: Clay Risser <email@clayrisser.com>
# -----
# Last Modified: 12-02-2023 11:10:09
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

include mkpm.mk
ifneq (,$(MKPM_READY))
include shared.mk

IMAGES = \
	base \
	slim \
	sway

.PHONY: build
build: | $(patsubst %,%/build,$(IMAGES))

.PHONY: push
push: | $(patsubst %,%/push,$(IMAGES))

.PHONY: pull
pull: | $(patsubst %,%/pull,$(IMAGES))

%/build:
	@$(MAKE) -sC $* build ARGS=$(ARGS)

%/pull:
	@$(MAKE) -sC $* pull ARGS=$(ARGS)

%/push:
	@$(MAKE) -sC $* push ARGS=$(ARGS)

%/up:
	@$(MAKE) -sC $* up ARGS=$(ARGS)

%/shell:
	@$(MAKE) -sC $* shell ARGS=$(ARGS)

%/desktop:
	@$(MAKE) -sC $* desktop ARGS=$(ARGS)

%/vnc:
	@$(MAKE) -sC $* vnc ARGS=$(ARGS)

endif
