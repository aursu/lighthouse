ARG centos=8.3.2011
FROM aursu/centos:${centos}-node

COPY system/google-chrome.repo /etc/yum.repos.d/google-chrome.repo
COPY system/gpg-pubkey /etc/pki/rpm-gpg/gpg-pubkey-d38b4796-570c8cd3

RUN set -ex \
    && rpm --import /etc/pki/rpm-gpg/gpg-pubkey-d38b4796-570c8cd3 \
    && dnf -y install google-chrome-stable \
    && dnf clean all && rm -rf /var/cache/dnf /var/lib/rpm/__db*

RUN set -ex \
	&& npm install -g lighthouse

RUN groupadd -g 1000 lighthouse \
    && useradd -u 1000 -g 1000 -d /var/lib/lighthouse -m -s /bin/bash lighthouse \
	&& mkdir -p /var/lib/lighthouse/.config/configstore /var/lib/lighthouse/reports \
	&& chown -R lighthouse:lighthouse /var/lib/lighthouse

COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

USER lighthouse
COPY config/lighthouse.json /var/lib/lighthouse/.config/configstore/lighthouse.json
COPY config/perf-config.js /var/lib/lighthouse/custom-config.js

VOLUME [ "/var/lib/lighthouse/reports" ]

WORKDIR /var/lib/lighthouse
ENTRYPOINT ["/docker-entrypoint.sh"]
