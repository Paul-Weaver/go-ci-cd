# Start with golang base image as the builder stage
FROM golang:1.20 AS builder

WORKDIR /src

# Copy go.mod and go.sum and download dependencies
COPY go.mod go.sum ./
RUN go mod download 

# Copy the rest of the source code
COPY . .

# Build the application
RUN CGO_ENABLED=0 GOOS=linux go build -o /app ./...

# Second stage, for the runtime
FROM alpine:latest

# Copy binary from the builder stage
COPY --from=builder /app /app

# Run the binary
ENTRYPOINT ["/app"]
