FROM alpine:latest

# declare the automatic docker variable
ARG TARGETARCH
# set the version
ARG PB_VERSION=0.34.2

# install tools
RUN apk add --no-cache unzip ca-certificates wget

# download (dynamic architecture)
# docker automatically swaps ${targetarch} with 'amd64' or 'arm64'
RUN wget https://github.com/pocketbase/pocketbase/releases/download/v${PB_VERSION}/pocketbase_${PB_VERSION}_linux_${TARGETARCH}.zip -O /tmp/pb.zip

# unzip
RUN unzip /tmp/pb.zip -d /pb/

# cleanup
RUN rm /tmp/pb.zip

# setup data dir
RUN mkdir -p /pb/pb_data

EXPOSE 8090

CMD ["/pb/pocketbase", "serve", "--http=0.0.0.0:8090", "--dir=/pb/pb_data"]
