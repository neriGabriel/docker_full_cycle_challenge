FROM golang:1.21 AS builder
WORKDIR /app
COPY main.go .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags="-s -w" -o fullcycle

FROM scratch
COPY --from=builder /app/fullcycle /
ENTRYPOINT ["/fullcycle"]