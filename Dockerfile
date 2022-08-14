FROM golang:latest AS builder

WORKDIR /app

COPY . /app

RUN go build main.go

FROM scratch

WORKDIR /app
COPY --from=builder /app/main .
ENTRYPOINT [ "./main"]
