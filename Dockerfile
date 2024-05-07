FROM node:alpine as build

ADD . /app
WORKDIR /app

RUN npm install
RUN npm run build

FROM caddy:2.7.6-alpine

COPY Caddyfile /etc/caddy/Caddyfile
COPY --from=build /app/build /www/html