FROM golang:alpine

RUN apk add bash && apk add make

WORKDIR app
 
COPY go.mod app/go.mod
COPY go.sum app/go.sum
COPY Makefile app/Makefile
COPY main.go app/main.go

RUN cd app && make build

CMD /go/app/app/demo.bin
