# Infinite Redirect Service

A simple web service built with Rust and Warp that creates infinite redirect loops for bots.

## Functionality

- Catches all incoming HTTP requests
- Generates cryptographically secure random 8-character URL-safe tokens
- Redirects each request to a new random path
- Creates infinite redirect loops that can confuse/trap malicious bots

## Build and Run

```bash
# Development
cargo run

# Production build
cargo build --release
./target/release/infinite-redirect
```

## Docker

```bash
docker build -t infinite-redirect .
docker run -p 80:80 infinite-redirect
```

## Configuration

The service runs on port 80 by default. Edit `src/main.rs` to change the port or binding address.