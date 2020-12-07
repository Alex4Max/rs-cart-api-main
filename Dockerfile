# Base
FROM node:12-alpine

# App directory
WORKDIR /app

# Dependencies
COPY package*.json ./
RUN npm install

# Build app
WORKDIR /app
COPY . .
RUN npm run build

# Application
USER node
ENV PORT=8080
EXPOSE 8080

CMD ["node", "dist/main.js"]
