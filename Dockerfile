FROM liuchong/rustup:stable

MAINTAINER Paul Watson 

WORKDIR /root


RUN apt-get update && \
    apt-get install --no-install-recommends -y \
    musl-tools && \
    rm -rf /var/lib/apt/lists/*

RUN rustup target add armv7-unknown-linux-musleabihf \
    --toolchain stable-x86_64-unknown-linux-gnu

# Set the default target to musl
RUN mkdir -p /.cargo/configclux && \
    echo "[build]\ntarget = \"armv7-unknown-linux-musleabihf\"" > /.cargo/configclux/muslrust