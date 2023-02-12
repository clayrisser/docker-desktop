# File: /chrome/Dockerfile
# Project: x11docker-images
# File Created: 12-02-2023 12:12:35
# Author: Clay Risser <email@clayrisser.com>
# -----
# Last Modified: 12-02-2023 12:17:29
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

FROM registry.gitlab.com/risserlabs/community/docker-sway/base:latest

RUN apt-get install -y \
    flatpak

USER admin

RUN flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
RUN flatpak install flathub com.github.Eloston.UngoogledChromium

USER root