# x402-tron-demo: Python server + facilitator
FROM python:3.12-slim

# Install system dependencies
RUN apt-get update && apt-get install -y \
    supervisor \
    git \
    && rm -rf /var/lib/apt/lists/*

# Create app directory
WORKDIR /app

# Copy requirements.txt first for better caching
COPY requirements.txt /app/requirements.txt

# Create virtual environment and install Python dependencies
RUN python -m venv /app/.venv && \
    /app/.venv/bin/pip install --upgrade pip && \
    /app/.venv/bin/pip install -r /app/requirements.txt

# Copy Python service code
COPY server/ /app/server/
COPY facilitator/ /app/facilitator/

# Copy supervisor configuration
COPY docker/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Copy startup script
COPY docker/entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

# Create logs directory
RUN mkdir -p /app/logs

# Expose ports
# 8000: server
# 8001: facilitator
EXPOSE 8000 8001

# Set environment variables
ENV PYTHONUNBUFFERED=1
ENV PATH="/app/.venv/bin:$PATH"

# Start services via entrypoint
ENTRYPOINT ["/app/entrypoint.sh"]
