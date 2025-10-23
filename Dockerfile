# Use an official Python base image
FROM python:3.10-slim

# Set environment variables for Python
ENV PYTHONUNBUFFERED=1

# Set the working directory in the container
WORKDIR /app

# Install system dependencies needed by some packages
RUN apt-get update && apt-get install -y \
    gcc \
    libmupdf-dev \
    libgl1-mesa-glx \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements and install Python dependencies
COPY requirements.txt .
RUN pip install --upgrade pip && pip install -r requirements.txt

# Copy application code
COPY . .

# Expose the Flask port (if using the default 5000, otherwise change as needed)
EXPOSE 5000

# Run your Flask app (update if your entrypoint is different)
CMD ["python", "app.py"]
