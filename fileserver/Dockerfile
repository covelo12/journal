# Use a small official Python image
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Copy only necessary files
COPY ./public /app/public
COPY fileserver.py /app

RUN pip install --no-cache-dir flask

EXPOSE 5000

CMD ["python", "fileserver.py"]
