FROM node:18-slim
WORKDIR /app

COPY app/package.json app/package-lock.json ./
RUN npm ci --legacy-peer-deps --omit=optional --no-audit --no-fund

COPY app/ .
EXPOSE 3000
CMD ["node", "app.js"]