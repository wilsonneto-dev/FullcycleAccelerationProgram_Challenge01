FROM node:15.14.0-alpine3.10
RUN apk add bash
WORKDIR /usr/src/app

COPY ./* ./

RUN npm i --production
RUN npm install pm2 -g

CMD ["pm2-runtime", "server.js"]
