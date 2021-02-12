FROM builder:1 as builder

FROM runtime:1
COPY --from=builder --chown=node /app/node_modules node_modules
COPY --chown=node . .
