FROM --platform=linux/arm64 node:18-slim

WORKDIR /app

# Copy only package.json (lock file does not exist)
COPY app/package.json ./

# Install dependencies
RUN npm install --no-audit --no-fund

# Copy application source
COPY app/ .

EXPOSE 3000
CMD ["node", "app.js"]