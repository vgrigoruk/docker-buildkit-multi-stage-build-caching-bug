FROM public.ecr.aws/peakon/node:14.15.4-builder AS builder

ADD package.json package-lock.json

RUN npm ci --no-audit

FROM public.ecr.aws/peakon/node:14.15.4-runtime

COPY --from=builder --chown=node /app/package.json package.json
