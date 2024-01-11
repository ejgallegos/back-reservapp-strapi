# Use a smaller base image
FROM node:18-alpine

# Set the working directory
WORKDIR /opt/app

# Install only necessary dependencies
RUN apk --no-cache add \
    build-base \
    zlib-dev \
    libpng-dev \
    nasm \
    vips-dev \
    git

# Set NODE_ENV to production by default
ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}

# Copy package.json and package-lock.json separately to leverage Docker caching
COPY package.json package-lock.json ./

# Install global dependencies and project dependencies
RUN npm install -g node-gyp && \
    npm config set fetch-retry-maxtimeout 600000 -g && \
    npm install --only=production

# Copy the rest of the application files
COPY . .

# Change ownership to the non-root user
RUN chown -R node:node /opt/app

# Switch to the non-root user
USER node

# Build the application
RUN npm run build

# Expose the necessary port
EXPOSE 1337

# Run the application
CMD ["npm", "run", "develop"]
