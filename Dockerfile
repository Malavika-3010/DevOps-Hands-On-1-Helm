FROM node:18-slim

WORKDIR /app

COPY app/package.json ./
RUN npm install --legacy-peer-deps --no-audit --no-fund --omit=optional

COPY app/ .

EXPOSE 3000
CMD ["node", "app.js"]