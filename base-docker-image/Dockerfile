# docker build -t base/nodejs ./base-docker-image

FROM alpine:3.15

RUN apk add --update nodejs npm

WORKDIR /root

#RUN npm install express

RUN npm install express lodash mem morgan node-os-utils pjson yargs-parser uuid \
    && npm install pm2 -g
