FROM alpine:latest

# 1. Declare the Automatic Docker Variable
ARG TARGETARCH
# 2. Set the Version
ARG PB_VERSION=0.34.2

# 3. Install Tools
RUN apk add --no-cache unzip ca-certificates wget

# 4. Download (Dynamic Architecture)
# Docker automatically swaps ${TARGETARCH} with 'amd64' or 'arm64'
RUN wget https://github.com/pocketbase/pocketbase/releases/download/v${PB_VERSION}/pocketbase_${PB_VERSION}_linux_${TARGETARCH}.zip -O /tmp/pb.zip

# 5. Unzip
RUN unzip /tmp/pb.zip -d /pb/

# 6. Cleanup
RUN rm /tmp/pb.zip

# 7. Setup Data Dir
RUN mkdir -p /pb/pb_data

EXPOSE 8090

CMD ["/pb/pocketbase", "serve", "--http=0.0.0.0:8090", "--dir=/pb/pb_data"]
