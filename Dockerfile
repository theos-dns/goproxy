FROM alpine:3.17 as builder

ARG GOPROXY_VERSION=v14.6

WORKDIR /root/goproxy

RUN wget https://github.com/snail007/goproxy/releases/download/${GOPROXY_VERSION}/proxy-linux-amd64.tar.gz
RUN tar -xvzf proxy-linux-amd64.tar.gz


FROM alpine:3.17
LABEL org.opencontainers.image.source="https://github.com/theos-dns/goproxy"

COPY --from=builder --chmod=777 /root/goproxy/proxy /root/goproxy

ENTRYPOINT ["/root/goproxy"]