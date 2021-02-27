FROM node:14.15.5 AS builder

ADD package.json package-lock.json

RUN npm ci --no-audit

FROM node:15.15.5-slim

COPY --from=builder --chown=node /app/package.json package.json
