# File: /ui.vision/Dockerfile
# Project: docker-desktop
# File Created: 12-02-2023 12:12:35
# Author: Clay Risser <email@clayrisser.com>
# -----
# Last Modified: 15-02-2023 08:22:32
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

FROM registry.gitlab.com/risserlabs/community/docker-desktop/ui-vision-base:0.0.1

USER root

COPY uivision.sh /usr/local/bin/uivision
COPY uivision-tail.sh /usr/local/bin/uivision-tail

RUN apt-get update && apt-get install -y \
    inotify-tools && \
    rm -rf /var/lib/apt/lists/* && \
    echo 'exec sh -c "uivision-tail /home/$USER/uivision/logs >> /home/$USER/docker.log"' >> /etc/sway/config && \
    sed -i 's|$DOCKER_CMD|sleep 5 && uivision $DOCKER_CMD|g' /etc/sway/config && \
    chmod +x /usr/local/bin/uivision && \
    chmod +x /usr/local/bin/uivision-tail

USER admin

CMD []
