FROM --platform=linux/arm64 node:18-slim

WORKDIR /app

# Copy dependency files first (CRITICAL)
COPY app/package.json app/package-lock.json ./

# Force npm registry + stable behavior
RUN npm config set registry https://registry.npmjs.org/ \
    && npm ci --no-audit --no-fund --prefer-offline --loglevel verbose

# Copy application source
COPY app/ .

EXPOSE 3000
CMD ["node", "app.js"]