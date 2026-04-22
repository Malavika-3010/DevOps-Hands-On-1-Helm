FROM --platform=linux/arm64 node:18-alpine

RUN apk add --no-cache python3 make g++

WORKDIR /app

COPY app/package*.json ./

RUN npm install --no-audit --no-fund

COPY app/ .

EXPOSE 3000

CMD ["node", "app.js"]