# Use official Python 3 image as base
FROM python:3.11-slim

# Create a non-root user with home directory
RUN addgroup --system appgroup && adduser --system --ingroup appgroup --home /home/appuser appuser \
    && mkdir -p /home/appuser && chown -R appuser:appgroup /home/appuser

ENV HOME=/home/appuser

# Set working directory and change ownership
WORKDIR /app
RUN chown appuser:appgroup /app

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    && pip install --upgrade pip

# Switch to non-root user
USER appuser

# Copy requirements and install Python dependencies
COPY requirements.txt .
RUN pip install -r app/requirements.txt

# Copy application files
COPY app/app.py .

# Expose port Flask will run on
EXPOSE 5000

# Run the application
CMD ["python", "app.py"]
