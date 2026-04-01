# F43 Universal Blue Image
FROM ghcr.io/ublue-os/fedora-kinoite:43

# Install test dialog package
RUN rpm-ostree install dialog
