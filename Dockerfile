FROM builder:1 as builder

FROM runtime:1
# Hack to set up an explicit dependency on builder stage
COPY --from=builder --chown=node /app/package.json package.json
