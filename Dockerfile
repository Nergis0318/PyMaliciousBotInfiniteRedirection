# Rust multi-stage build for infinite redirect service
FROM rust:1.70-alpine AS builder

# Install build dependencies
RUN apk update && apk upgrade && \
    apk add --no-cache gcc musl-dev

WORKDIR /app

# Copy source files
COPY Cargo.toml Cargo.lock ./
COPY src ./src

# Build in release mode for small binary
RUN cargo build --release

# Final stage with minimal image
FROM alpine:3.18

# Install runtime dependencies (none needed for static build)
RUN apk update && apk upgrade

WORKDIR /app

# Copy the built binary
COPY --from=builder /app/target/release/infinite-redirect .

# Run the service
EXPOSE 80

ENTRYPOINT ["./infinite-redirect"]
