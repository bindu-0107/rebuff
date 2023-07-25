# Dockerfile
# Use an official Node.js runtime as the parent image
FROM node:18

# ENV NEXT_PUBLIC_SUPABASE_URL = https://oxpnjewvyehdovvyosxt.supabase.co

# ENV NEXT_PUBLIC_SUPABASE_ANON_KEY = eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im94cG5qZXd2eWVoZG92dnlvc3h0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODk5MzI5OTMsImV4cCI6MjAwNTUwODk5M30.S9k7wzNy0X8qF8GkD3j3kFfB4hL-UC8PG8827_d5-gg

# Set the working directory in the container to /app
WORKDIR /app

COPY . /app/

RUN npm install
# Copy package.json and package-lock.json to the working directory
RUN cd server && \
    npm install

# Install any needed packages specified in package.json
# RUN npm install

# Bundle the app source code inside the Docker image
# COPY server/ .

# Build the project
RUN npm run build

# The app is served by Next.js on port 3000, so expose this port
EXPOSE 3000
WORKDIR /app/server
# Define the command to run the app
CMD ["npm", "start"]





