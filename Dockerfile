# Use a lightweight base image
FROM python:3.9-slim

# Set a non-root user to run the container
RUN addgroup --system appgroup && adduser --system --ingroup appgroup appuser

# Install dependencies
RUN pip install --no-cache-dir flask

# Set the working directory
WORKDIR /app

# Copy in the web server script
COPY 503_server.py /app/503_server.py

# Make sure the user has permission to the directory
RUN chown -R appuser:appgroup /app

# Run the container as the non-root user
USER appuser

# Expose port 8080
EXPOSE 8080

# Run the server on port 8080
CMD ["python", "/app/503_server.py"]
