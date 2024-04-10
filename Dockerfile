FROM golang:alpine as builder
WORKDIR /app
COPY . .
RUN go mod init app
RUN go build -o main .

FROM scratch
COPY --from=builder /app/main /app/main
CMD ["/app/main"]
