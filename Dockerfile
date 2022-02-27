FROM golang as builder

WORKDIR /app

COPY rocks.go .

RUN go build rocks.go

FROM scratch

WORKDIR /app

COPY --from=builder /app/rocks ./

ENTRYPOINT ["./rocks"] 