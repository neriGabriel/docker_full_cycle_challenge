FROM golang:1.21-alpine AS builder
WORKDIR /app
COPY main.go .
RUN go build -o fullcycle .

FROM alpine:latest
WORKDIR /root/
COPY --from=builder /app/fullcycle .
CMD ["./fullcycle"]