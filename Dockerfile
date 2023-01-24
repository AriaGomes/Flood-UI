# Use node alpine docker image
FROM alpine:latest
WORKDIR /home
COPY flood.sh ./
RUN chmod +x ./flood.sh

# Install runtime dependencies
RUN apk --no-cache add \
    git \
    npm

# Expose port 3000
EXPOSE 3000

# Flood
ENV FLOOD_OPTION_HOST="0.0.0.0"
ENTRYPOINT ./flood.sh