# Start with a minimal base image
FROM golang:1.22-alpine

# Set the working directory
WORKDIR /app

# Copy application files
COPY app .

# Build the application
RUN go build -o myapp .

# Command to run the application
CMD ["./myapp"]
