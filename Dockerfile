# Use node alpine docker image
FROM docker.io/node:alpine

ARG PACKAGE=@jesec/flood
ARG VERSION=latest

# Get specified version from npm
RUN npm i -g "${PACKAGE}"@"${VERSION}" &&\
    node --version &&\
    npm ls --global &&\
    npm cache clean --force

# Install runtime dependencies
RUN apk --no-cache add \
    mediainfo \
    tini

# Create directory and set permissions
RUN mkdir -p /.local/share/flood && \
    chown -R 99:100 /.local

# Run as "download" user
USER 99:100

# Expose port 3000
EXPOSE 3000

# Flood
ENV FLOOD_OPTION_HOST="0.0.0.0"
ENTRYPOINT ["/sbin/tini", "--", "flood"]
