FROM ubuntu:18.04

# install host tools required by the build environment
RUN apt update && DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends \
        apt-transport-https \
        build-essential \
        ca-certificates \
        curl \
        file \
        gawk \
        gettext \
        git \
        gosu \
        libncurses5 \
        libssl-dev \
        ocaml-nox \
        openssl \
        python \
        python3 \
        sharutils \
        subversion \
        unzip \
        vim \
        wget \
        zlib1g-dev \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

# top level build directory
RUN mkdir /build
VOLUME /build
WORKDIR /build

# entrypoint uses gosu so that ownership of generated files
# is the same as those in the build directory
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
