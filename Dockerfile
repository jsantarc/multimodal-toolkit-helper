# Use Python 3.10 slim image as base for smaller image size
FROM python:3.10-slim

# Set working directory inside container
WORKDIR /app

# Install system dependencies required for building Python packages
# build-essential: provides gcc, make, etc. needed for compiling native extensions
# Clean up apt cache to reduce image size
RUN apt-get update && apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements first to leverage Docker layer caching
# This layer will only rebuild if requirements.txt changes
COPY requirements.txt .

# Install Python dependencies
# --no-cache-dir reduces image size by not storing pip cache
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the project files
COPY . .

# Expose Jupyter notebook port
EXPOSE 8888

# Run Jupyter notebook server
# --ip=0.0.0.0: listen on all interfaces (required for Docker)
# --no-browser: don't try to open a browser inside container
# --allow-root: allow running as root user
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
