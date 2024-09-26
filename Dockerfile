# Use Node.js 14 LTS as the base image
FROM node:14

# Set working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Clean npm cache and install dependencies using npm ci for a clean install
RUN npm cache clean --force && npm ci

# Copy the rest of the application files to the container
COPY . .

# Build the React app
RUN npm run build

# Expose port 3000 (or whichever port your React app uses)
EXPOSE 3000

# Use npx serve to serve the static files from the build directory
CMD ["npx", "serve", "-s", "build"]
