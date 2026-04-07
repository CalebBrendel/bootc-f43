# F43 Universal Blue Image
FROM ghcr.io/ublue-os/kinoite-main:latest

COPY repos/*.repo /etc/yum.repos.d/

COPY packages.txt /tmp/packages.txt

RUN rpm-ostree install \
    --allow-inactive \
    $(grep -vE '^(kernel|systemd|glibc|filesystem|setup|basesystem|Sunshine|bazaar|krunner-bazaar|uupd|libaacs|libbdplus|xapp-symbolic-icons|akmod-v4l2loopback|google-noto-sans-symbols|goxlr-utility|goxlr-utility-ui|libavcodec-freeworld|liblqr|libndi-sdk|ndi-sdk|ntfs|obs-studio-plugin-distroav|obs-studio-plugin-x264|polkit-qt6|rpmfusion-free-appstream-data|rpmfusion-free-release|rpmfusion-nonfree-appstream-data|rpmfusion-nonfree-release|svt-hevc-libs|ungoogled-chromium|ungoogled-chromium-common|v4l2loopback|winboat|gstreamer1-plugins-bad|fdk-aac-free|openh264|ocl-icd|OpenCL-ICD-Loader|mozilla-openh264)' /tmp/packages.txt | xargs) && \
    rpm-ostree cleanup --pending --repomd

RUN rm /tmp/packages.txt
