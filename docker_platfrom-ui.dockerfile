# Stage 1: Node.js build

# Use the official Node.js LTS (Long Term Support) version as the base image
FROM node:lts AS builder

ENV SERVICE_NAME=platform

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json (if available) into the working directory
COPY ${SERVICE_NAME}-ui/package*.json ./

# Install the dependencies
RUN npm ci

# Copy the rest of the application code into the working directory
COPY ${SERVICE_NAME}-ui/ .
COPY /config/${SERVICE_NAME}-ui/.env ./.env
COPY /config/${SERVICE_NAME}-ui/nginx-custom.conf ./nginx-custom.conf

# Generate openapi connections
RUN npm run generate-all

# Build the angular app in production mode and store the artifacts in dist folder
RUN npm run build

# Stage 2: Serve app with Nginx server

# Use official nginx image. Use the "alpine" variant for the smaller size
FROM nginx:alpine

ENV SERVICE_NAME=platform

# Copy the build output to replace the default nginx contents.
COPY --from=builder /app/build /usr/share/nginx/html

# Use the default production configuration
COPY --from=builder /app/nginx-custom.conf /etc/nginx/conf.d/default.conf

# Expose port 80
EXPOSE 80

# Start the server
CMD ["nginx", "-g", "daemon off;"]