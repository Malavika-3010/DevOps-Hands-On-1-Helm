FROM --platform=linux/arm64 node:18-slim

# Force IPv4 for apt (fixes CI failures)
RUN apt-get update -o Acquire::ForceIPv4=true && \
    apt-get install -y --no-install-recommends \
        python3 \
        make \
        g++ && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy dependency files
COPY app/package*.json ./

# Install dependencies
RUN npm install --no-audit --no-fund

# Copy application source
COPY app/ .

EXPOSE 3000

CMD ["node", "app.js"]