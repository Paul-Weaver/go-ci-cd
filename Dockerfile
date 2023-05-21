# Use official Golang image as a builder
FROM golang:1.17 AS builder

# Set working directory
WORKDIR /app

# Copy Go mod and source code to the container
COPY go.mod ./
COPY main.go .

# Build the Go app to a binary
RUN CGO_ENABLED=0 GOOS=linux go build -o /app/myapp .

# Use Alpine Linux for the runtime stage
FROM alpine:latest  

# Expose port 8080 for the application
EXPOSE 8080

# Copy the binary from the builder stage
COPY --from=builder /app/myapp /app/myapp

# Run the binary
CMD ["/app/myapp"]
