FROM --platform=linux/arm64 node:18-slim

# Install build tools for native npm modules
RUN apt-get update && apt-get install -y \
    python3 \
    make \
    g++ \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy dependency files first
COPY app/package*.json ./

# Install dependencies
RUN npm install --no-audit --no-fund

# Copy application code
COPY app/ .

EXPOSE 3000

CMD ["node", "app.js"]