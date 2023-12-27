# FROM node:18.17.1

# Run useradd -m appuser

# RUN npm install -g npm@9.1.3

# ADD package.json .
# ADD index.js .
# ADD build .
# COPY . .
# RUN npm install

# EXPOSE 8080

# CMD [ "node", "index.js" ]

# Use an updated and secure base image
FROM node:18.19.1

# Set a non-root user for better security
RUN useradd -m appuser

# Install a specific version of npm, check for the latest secure version
RUN npm install -g npm@9.1.3

# Copy the package.json and package-lock.json (if available)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy your application files
COPY . .

# Set the user to the non-root user
USER appuser

# Expose the port your app runs on
EXPOSE 8080

# Start the application
CMD ["node", "index.js"]
