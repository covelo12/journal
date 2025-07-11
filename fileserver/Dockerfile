# Use a small official Python image
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Copy only necessary files
COPY app.py ./fileserver.py

# Install Flask
RUN pip install --no-cache-dir flask

# Expose port
EXPOSE 5000

# Run the app
CMD ["python", "app.py"]
