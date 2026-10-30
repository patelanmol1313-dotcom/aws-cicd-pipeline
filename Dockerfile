
# Use Python 3.12 lightweight image
FROM python:3.12-slim

# Set working directory inside container
WORKDIR /app

# Prevent Python from creating bytecode files
ENV PYTHONDONTWRITEBYTECODE=1

# Display Python logs immediately
ENV PYTHONUNBUFFERED=1

# Copy dependency file
COPY requirements.txt .

# Install application dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy application source code
COPY app/ ./app/

# Configure application port
ENV PORT=5001

# Document the container port
EXPOSE 5001

# Start application using Gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:5001", "app.main:app"]
