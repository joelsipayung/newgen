FROM golang:latest
RUN mkdir -p /app
COPY /belajar-docker/main.go /app/main.go
CMD ["go", "run","/app/main.go"]
