FROM alpine:latest

ARG PB_VERSION=0.34.2

RUN apk add --no-cache \
    unzip \
    ca-certificates

# Download and unzip PocketBase
ADD https://github.com/pocketbase/pocketbase/releases/download/v${PB_VERSION}/pocketbase_${PB_VERSION}_linux_amd64.zip /tmp/pb.zip
RUN unzip /tmp/pb.zip -d /pb/

# Create the data directory
RUN mkdir -p /pb/pb_data

# Expose the default port
EXPOSE 8090

# Run PocketBase
# --http=0.0.0.0:8090 binds to all interfaces (required for Docker)
# --dir=/pb/pb_data ensures data goes to the volume
# --publicDir=/pb/pb_public serves static files (optional, but good for hosting frontends)
CMD ["/pb/pocketbase", "serve", "--http=0.0.0.0:8090", "--dir=/pb/pb_data"]
