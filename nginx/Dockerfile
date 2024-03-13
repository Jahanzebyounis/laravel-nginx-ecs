FROM nginx:alpine

# Copy nginx configurations
COPY default.conf /etc/nginx/conf.d/

# Expose port
EXPOSE 80

# Start Nginx when the container starts
CMD ["nginx", "-g", "daemon off;"]