FROM golang:1.22

WORKDIR /usr/src/app

COPY go.mod go.sum ./

RUN go mod download

COPY . .
# вот здесь не совсем понятно, нужно ли было добавлять CGO_ENABLED=0. Это делается всегда?
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /42-docker-final

CMD ["/42-docker-final"]