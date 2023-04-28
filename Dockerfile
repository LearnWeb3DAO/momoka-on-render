FROM node:18-alpine AS base

RUN apk update
RUN apk add --no-cache libc6-compat
RUN corepack enable
RUN corepack prepare pnpm@latest --activate

ENV PNPM_HOME=/usr/local/bin

FROM base as runtime

RUN pnpm add -g @lens-protocol/momoka

CMD ["sh", "-c", "momoka --node $NODE_URL --environment=POLYGON --concurrency=100 --fromHead=true"]