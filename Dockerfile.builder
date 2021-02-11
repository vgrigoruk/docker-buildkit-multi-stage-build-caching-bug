FROM node:14.15.5-buster

WORKDIR /app

ONBUILD COPY package.json package-lock.json ./

ONBUILD RUN sleep 10 && npm ci --no-audit
