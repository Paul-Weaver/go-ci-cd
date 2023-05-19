# Start with the golang base image as the builder stage
FROM golang:1.16 AS builder

WORKDIR /app

# Copy the Go application code
COPY main.go .

# Build the application
RUN CGO_ENABLED=0 GOOS=linux go build -o /app/myapp .

# Second stage, for the runtime
FROM alpine:latest

# Copy the binary from the builder stage
COPY --from=builder /app/myapp /app/myapp

# Run the binary
CMD ["/app/myapp"]