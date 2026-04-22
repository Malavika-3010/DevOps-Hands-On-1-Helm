FROM --platform=linux/arm64 node:18-slim

WORKDIR /app

# Copy only package.json (no lock file)
COPY app/package.json ./

# Make npm CI-stable
RUN npm config set registry https://registry.npmjs.org/ \
 && npm config set fetch-retries 5 \
 && npm config set fetch-retry-mintimeout 20000 \
 && npm config set fetch-retry-maxtimeout 120000 \
 && npm install --no-audit --no-fund --omit=optional

# Copy application source
COPY app/ .

EXPOSE 3000
CMD ["node", "app.js"]