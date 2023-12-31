# File: /base/Dockerfile
# Project: docker-desktop
# File Created: 11-02-2023 13:12:34
# Author: Clay Risser <email@clayrisser.com>
# -----
# Last Modified: 15-02-2023 05:26:25
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

FROM debian:sid

ENV LANG=en_US.UTF-8 \
    USER=admin

COPY entrypoint.sh /usr/local/bin/entrypoint

RUN echo $LANG UTF-8 > /etc/locale.gen && \
    export DEBIAN_FRONTEND=noninteractive && apt-get update && \
    apt-get install -y --no-install-recommends \
    x11-xserver-utils \
    xauth \
    xinit && \
    apt-get install -y \
    curl \
    dbus-x11 \
    j4-dmenu-desktop \
    libxv1 \
    locales \
    mesa-utils \
    mesa-utils-extra \
    openssl \
    procps \
    psmisc \
    sway \
    wayvnc \
    xwayland && \
    rm -rf /var/lib/apt/lists/* && \
    update-locale --reset LANG=$LANG && \
    chmod +x /usr/local/bin/entrypoint && \
    addgroup $USER && adduser --ingroup $USER $USER && \
    openssl req -x509 -newkey rsa:4096 -sha256 -days 999999 -nodes \
    -keyout key.pem -out cert.pem -subj /CN=localhost \
    -addext subjectAltName=DNS:localhost,DNS:localhost,IP:127.0.0.1

COPY config.sway /etc/sway/config
COPY xinitrc /xinitrc

WORKDIR /home/$USER

ENTRYPOINT ["/usr/local/bin/entrypoint"]

USER $USER

ENV RESOLUTION="1600x900" \
    VNC=true \
    VNC_ENABLE_AUTH=false \
    VNC_PASSWORD="P@ssw0rd" \
    VNC_ADDRESS="0.0.0.0"
