FROM mhart/alpine-node:14 as builder

WORKDIR /app

COPY dist /app/dist
COPY node_modules /app/node_modules

FROM alpine:3.11

COPY --from=builder /usr/bin/node /usr/bin/
COPY --from=builder /usr/lib/libgcc* /usr/lib/libstdc* /usr/lib/
COPY --from=builder /app /app

WORKDIR /app

RUN apk add --no-cache tini=0.18.0-r0

ENV PORT=8080 \
	NODE_ENV=production \
	LOG_LEVEL=debug \
	MAX_EVENT_LOOP_DELAY=1000 \
	MAX_RSS_BYTES=0 \
	MAX_HEAP_USED_BYTES=0 \
	MAX_AGE=86400

EXPOSE $PORT
EXPOSE 3002

# an init entrypoint that simplifies signal handling
ENTRYPOINT ["tini", "--"]

CMD ["node", "dist/src/index.js"]
