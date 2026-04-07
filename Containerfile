# F43 Universal Blue Image
FROM ghcr.io/ublue-os/kinoite-main:latest

COPY repos/*.repo /etc/yum.repos.d/

COPY packages.txt /tmp/packages.txt

RUN rpm-ostree install \
    --allow-inactive \
    $(grep -vE '^(kernel|systemd|glibc|filesystem|setup|basesystem|Sunshine|bazaar|krunner-bazaar|uupd|libaacs|libbdplus|xapp-symbolic-icons)' /tmp/packages.txt | xargs) && \
    rpm-ostree cleanup -af

RUN rm /tmp/packages.txt
