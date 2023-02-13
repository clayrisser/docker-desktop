# File: /chrome/Dockerfile
# Project: x11docker-images
# File Created: 12-02-2023 12:12:35
# Author: Clay Risser <email@clayrisser.com>
# -----
# Last Modified: 13-02-2023 10:53:28
# Modified By: Clay Risser <email@clayrisser.com>
# -----
# Risser Labs LLC (c) Copyright 2021 - 2023
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

FROM debian

WORKDIR /tmp

RUN apt-get update && apt-get install -y \
    devscripts \
    git \
    equivs

RUN git clone https://github.com/ungoogled-software/ungoogled-chromium-debian.git
WORKDIR /tmp/ungoogled-chromium-debian
RUN git submodule update --init --recursive
RUN debian/rules setup && \
    mk-build-deps --install \
    --tool='apt-get -o Debug::pkgProblemResolver=yes --no-install-recommends --yes' \
    debian/control && \
    rm ungoogled-chromium-build-deps_*
RUN dpkg-buildpackage -b -uc

# FROM registry.gitlab.com/risserlabs/community/docker-sway/slim:0.0.1
