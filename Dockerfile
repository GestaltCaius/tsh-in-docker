FROM ubuntu:22.04

LABEL maintainer="gestalt caius" \
      description="Any tsh CLI version in docker, kubectl and k9s included."

ARG TELEPORT_VERSION=13.4.26
ARG KUBECTL_VERSION=1.33.2
ARG K9S_VERSION=0.50.9

ARG TARGETARCH

RUN apt update \
    && apt install -y wget \
    && rm -rf /var/lib/apt/lists/*

RUN wget "https://dl.k8s.io/release/v${KUBECTL_VERSION}/bin/linux/${TARGETARCH}/kubectl" \
    && chmod +x ./kubectl \
    && mv ./kubectl /usr/local/bin/kubectl

RUN wget "https://github.com/derailed/k9s/releases/download/v${K9S_VERSION}/k9s_Linux_${TARGETARCH}.deb" \
    && apt-get install -y --allow-downgrades ./k9s_Linux_${TARGETARCH}.deb \
    && rm ./k9s_Linux_${TARGETARCH}.deb

RUN wget "https://cdn.teleport.dev/teleport-v${TELEPORT_VERSION}-linux-${TARGETARCH}-bin.tar.gz" \
    && tar -xzf "teleport-v${TELEPORT_VERSION}-linux-${TARGETARCH}-bin.tar.gz" \
    && cd teleport && ./install && cd .. \
    && rm -rf teleport "teleport-v${TELEPORT_VERSION}-linux-${TARGETARCH}-bin.tar.gz"

WORKDIR /root
CMD ["bash"]
