FROM node:alpine as build

WORKDIR /app

COPY package.json package-lock.json ./
RUN npm install

COPY . .
RUN npm run build

FROM caddy:2.7.6-alpine

COPY Caddyfile /etc/caddy/Caddyfile
COPY --from=build /app/build /srv