FROM --platform=linux/arm64 node:18-slim

WORKDIR /app
COPY app/package*.json ./
RUN npm install --no-audit --no-fund
COPY app/ .

EXPOSE 3000
CMD ["node", "app.js"]