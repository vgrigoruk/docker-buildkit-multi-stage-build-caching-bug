FROM public.ecr.aws/peakon/node:14.15.4

WORKDIR /app

ONBUILD COPY package.json package-lock.json ./

ONBUILD RUN sleep 30 && npm ci --no-audit
