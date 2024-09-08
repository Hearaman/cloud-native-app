# Step 1: Use the official Node.js 18 image as the base image
FROM node:18

# Step 2: Set the working directory inside the container
WORKDIR /usr/src/app

# Step 3: Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Step 4: Install the application dependencies
RUN npm install

# Step 5: Copy the rest of the application files to the container
COPY . .

# Step 6: Expose the port that the application will run on
EXPOSE 3000

# Step 7: Define the command to run the app
CMD [ "npm", "start" ]
