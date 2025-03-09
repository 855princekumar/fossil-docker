# Use Alpine 3.13 for compatibility
FROM alpine:3.13

# Set Fossil version (default: latest)
ARG VERSION=latest

# Maintainer information
LABEL version="1.0.0"
LABEL maintainer="Dustin Reynolds @ Electric-Toast.com"

# Install dependencies needed for building Fossil from source
RUN apk update && apk upgrade && apk add --no-cache \
    curl gcc make tcl musl-dev openssl-dev zlib-dev \
    openssl-libs-static zlib-static

# Download and build Fossil from source
RUN if [ "$VERSION" = "latest" ] ; then \
        curl "https://fossil-scm.org/home/tarball/fossil-src.tar.gz?name=fossil-src&uuid=trunk" -o fossil-src.tar.gz \
        && tar xfvz fossil-src.tar.gz; \
    else \
        curl "https://fossil-scm.org/home/uv/fossil-src-${VERSION}.tar.gz" -o fossil-src.tar.gz \
        && tar xfvz fossil-src.tar.gz \
        && mv fossil-${VERSION} fossil-src; \
    fi \
    && cd fossil-src \
    && ./configure --static --disable-fusefs --with-th1-docs --with-th1-hooks --json \
    && make \
    && strip fossil \
    && make install \
    && apk del --no-cache curl gcc make tcl musl-dev openssl-dev zlib-dev \
    && rm -f /var/cache/apk/* \
    && cd / && rm -rf fossil-src*

# Set environment variables
ENV FOSSIL_PORT=9090
ENV FOSSIL_REPO_LOC=/opt/fossil-repositories

# Ensure repository directory exists
RUN mkdir -p ${FOSSIL_REPO_LOC} && chmod -R 777 ${FOSSIL_REPO_LOC}

# Copy entrypoint script inside the container
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Expose Fossil web interface on port 9090
EXPOSE 9090

# Use the entrypoint script to manage Fossil
CMD ["/bin/sh", "-c", "/entrypoint.sh"]
