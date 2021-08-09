FROM xsede/centos-nix-base:latest

################## METADATA ######################

LABEL base_image="xsede/centos-nix-base"
LABEL version="1.0.0"
LABEL software="sc-benchmakk"
LABEL software.version="3.8.8"
LABEL about.summary="Container with the sc-benchmark installed from https://github.com/FredHutch/sc-benchmark.git"
LABEL about.home="https://github.com/XSEDE/nix-container-sc-benchmark"
LABEL about.documentation="https://github.com/XSEDE/nix-container-sc-benchmark"
LABEL about.license_file="https://github.com/XSEDE/nix-container-sc-benchmark"
LABEL about.license="MIT"
LABEL about.tags="example-container" 
LABEL extra.directories="/usr/local/sc-benchmark/"
LABEL authors="XCRI <help@xsede.org>"


SHELL ["/bin/bash", "-c"]

USER root

ENV NIXENV "/root/.nix-profile/etc/profile.d/nix.sh"

RUN mkdir -p /root/.config/nixpkgs/

COPY config.nix /root/.config/nixpkgs/
COPY dev.nix /root/
COPY prod-env.nix /root/
COPY persist-env.sh /root/

RUN for i in $(ls /root/.nix-profile/bin) ; do ln -s /root/.nix-profile/bin/"$i" /usr/bin ; done

RUN chmod +x /root/.nix-profile/etc/profile.d/nix.sh

# initiate environment
RUN $NIXENV && \
    cd /tmp && \
    bash /root/persist-env.sh /root/prod-env.nix

# Prep dev environment ahead of time
RUN nix-shell /root/dev.nix

