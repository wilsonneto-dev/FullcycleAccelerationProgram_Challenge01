# stage 0: building
FROM node:15.14.0-alpine3.10 as build-stage

WORKDIR /usr/src/app
COPY ./package*.json ./
RUN npm install
COPY . ./
RUN ls
RUN npm run build

# Stage 1: generate a nginx image
FROM nginx:1.19.10
COPY --from=build-stage /usr/src/app/build/ /usr/share/nginx/html