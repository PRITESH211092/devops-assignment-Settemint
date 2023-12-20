# Use an official Node.js runtime as a parent image
FROM node:14-alpine

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install app dependencies
RUN npm install --production

# Bundle app source
COPY . .

#RUN npx nx run nft-bridge:lint
# Expose the port the app runs on
EXPOSE 8000

#RUN npm run test

#RUN nx build nft-bridge

# Command to run your application
CMD ["npm", "./dist/apps/nft-bridge/main.js”]
