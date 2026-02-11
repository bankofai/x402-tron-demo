#!/bin/bash
set -e

echo "=========================================="
echo "Building and starting x402-tron-demo"
echo "=========================================="

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

# Check if .env exists
if [ ! -f ".env" ]; then
    echo "❌ Error: .env file not found"
    echo ""
    echo "Please create .env from .env.sample:"
    echo "  cp .env.sample .env"
    exit 1
fi

# Remove stale container if it exists
CONTAINER_NAME="x402-tron-demo"
if docker ps -a --format '{{.Names}}' | grep -q "^${CONTAINER_NAME}$"; then
    echo "Removing existing container: ${CONTAINER_NAME}"
    docker rm -f "${CONTAINER_NAME}"
fi

# Build and start
echo ""
echo "Building Docker image and starting services..."
docker compose up -d --build

echo ""
echo "=========================================="
echo "✅ Services started"
echo "=========================================="
echo "  Server API:  http://localhost:8000"
echo "  Facilitator: http://localhost:8001"
echo ""
echo "View logs:  docker compose logs -f"
echo "Stop:       docker compose down"
echo "=========================================="
