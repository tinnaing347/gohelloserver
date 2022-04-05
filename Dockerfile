FROM golang:1.18 as Builder

ARG GITHUB_ACCESS_TOKEN

WORKDIR /app
ADD . /app
COPY . /app 

RUN go env -w GOPRIVATE=github.com/tinnaing347 
RUN git config --global url."https://tinnaing347:$GITHUB_ACCESS_TOKEN@github.com".insteadOf "https://github.com" \
    && go mod tidy

RUN go build -o /gohelloserver

EXPOSE 8080

CMD [ "/gohelloserver" ]




