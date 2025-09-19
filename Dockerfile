# Use the Node official image
# https://hub.docker.com/_/node
FROM node:lts

# Create and change to the app directory.
WORKDIR /app

# Copy the files to the container image
COPY package*.json ./

# Install packages
RUN npm ci

# Copy local code to the container image.
COPY . ./

# Generate Prisma client
RUN npx prisma generate

# Build the app.
RUN npm run build

# Serve the app
CMD ["npm", "run", "start:prod"]
