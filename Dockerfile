
FROM golang:1.22.1-alpine as base

WORKDIR /app

COPY . .
RUN go mod download
RUN go build main.go

FROM alpine:3.19.0
WORKDIR /app
COPY --from=base /app/main /app/main
EXPOSE 8088
CMD ["./main"]
