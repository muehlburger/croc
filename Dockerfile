FROM golang:1.14-alpine as builder
RUN apk add --no-cache git
WORKDIR /go/croc
COPY . .
RUN go build -v

FROM alpine:latest 
EXPOSE 9009
EXPOSE 9010
EXPOSE 9011
EXPOSE 9012
EXPOSE 9013
COPY --from=builder /go/croc/croc /go/croc/croc-entrypoint.sh /
ENTRYPOINT ["/croc-entrypoint.sh"]
CMD ["relay"]
