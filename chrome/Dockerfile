# File: /chrome/Dockerfile
# Project: docker-desktop
# File Created: 12-02-2023 12:12:35
# Author: Clay Risser <email@clayrisser.com>
# -----
# Last Modified: 15-02-2023 04:39:03
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

FROM registry.gitlab.com/risserlabs/community/docker-desktop/slim:0.0.1

ENV CHROME_VERSION=110.0.5481.77

RUN curl -LO https://github.com/berkley4/ungoogled-chromium-debian/releases/download/${CHROME_VERSION}-1/ungoogled-chromium_${CHROME_VERSION}-1_amd64.deb && \
    curl -LO http://ftp.de.debian.org/debian/pool/main/f/flac/libflac8_1.3.3-2+deb11u1_amd64.deb && \
    curl -LO http://ftp.de.debian.org/debian/pool/main/t/tiff/libtiff5_4.2.0-1+deb11u1_amd64.deb && \
    curl -LO http://ftp.de.debian.org/debian/pool/main/libw/libwebp/libwebp6_0.6.1-2.1_amd64.deb && \
    apt-get update && \
    apt-get install ./*.deb || true && \
    apt-get install -f && \
    apt-get install -y ./*.deb && \
    rm -rf ./*.deb && \
    rm -rf /var/lib/apt/lists/* && \
    sed -i 's|Exec=/usr/bin/chromium|Exec=/usr/bin/chromium --no-sandbox|g' /usr/share/applications/chromium.desktop
