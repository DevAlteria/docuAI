FROM alpine:3.19

RUN apk update

RUN apk add nginx openrc

RUN rc-update add nginx default

CMD ["nginx", "-g", "daemon off;"]

