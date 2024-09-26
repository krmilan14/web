# Use a base image with Node.js
FROM node:16

# Create and set working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application files
COPY . .

# Build the React app
RUN npm run build


# Expose port 3000 (or whichever port your app uses)
EXPOSE 3000

# Start the application (assuming you use a package like serve to serve the static files)
CMD ["npx", "serve", "-s", "build"]
