# Use the official Nginx image from Docker Hub
FROM nginx:alpine

# Remove the default nginx.html file
RUN rm /usr/share/nginx/html/index.html

# Copy your HTML file into the Nginx server
COPY index.html /usr/share/nginx/html

# Expose port 80 to the Docker host, so we can access it
# from the outside.
EXPOSE 80

# The base image nginx:alpine contains a CMD directive
# that starts Nginx for us, so we don't need to add it ourselves
