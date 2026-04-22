FROM node:18

WORKDIR /app

# Copy only package.json (no lock file)
COPY app/package.json ./

RUN npm install --legacy-peer-deps --no-audit --no-fund --omit=optional

# Copy application source
COPY app/ .

EXPOSE 3000
CMD ["node", "app.js"]