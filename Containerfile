# F43 Universal Blue Image
FROM ghcr.io/ublue-os/kinoite-main:latest

RUN curl -Lo /etc/yum.repos.d/_copr_hhd-dev-hhd.repo https://copr.fedorainfracloud.org/coprs/hhd-dev/hhd/repo/fedora-40/hhd-dev-hhd-fedora-40.repo && \
    curl -Lo /etc/yum.repos.d/terra.repo https://github.com/terrapkg/subatomic-repos/raw/main/terra.repo

COPY packages.txt /tmp/packages.txt

RUN rpm-ostree install \
    --allow-inactive \
    $(grep -vE '^(kernel|systemd|glibc|filesystem|setup|basesystem)' /tmp/packages.txt | xargs) && \
    rpm-ostree cleanup -af

RUN rm /tmp/packages.txt
