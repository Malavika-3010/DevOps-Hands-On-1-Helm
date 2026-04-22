FROM node:18-slim

WORKDIR /app

# Copy package files first
COPY app/package.json app/package-lock.json ./

# Use npm ci for reproducible builds
RUN npm ci --omit=optional --no-audit --no-fund

# Copy source code
COPY app/ .

EXPOSE 3000
CMD ["node", "app.js"]