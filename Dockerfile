FROM node:18-alpine

RUN npm install -g @lens-protocol/momoka

CMD ["sh", "-c", "momoka --node $NODE_URL --environment=POLYGON --concurrency=100 --fromHead=true"]