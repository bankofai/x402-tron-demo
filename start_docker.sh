#!/bin/bash
set -e

echo "=========================================="
echo "Starting x402-tron-demo"
echo "=========================================="

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    echo "❌ Error: Docker is not installed"
    echo "Please install Docker from https://www.docker.com/"
    exit 1
fi

# Check if .env file exists
if [ ! -f ".env" ]; then
    echo "❌ Error: .env file not found"
    echo ""
    echo "Please create .env file with required variables:"
    echo "  TRON_PRIVATE_KEY=your_private_key_here"
    echo "  PAY_TO_ADDRESS=your_tron_address_here"
    echo ""
    echo "You can use .env.example as a template if it exists."
    exit 1
fi

# Configuration
IMAGE_NAME="${IMAGE_NAME:-x402-tron-demo}"
IMAGE_TAG="${IMAGE_TAG:-latest}"
CONTAINER_NAME="${CONTAINER_NAME:-x402-tron-demo}"
FULL_IMAGE_NAME="${IMAGE_NAME}:${IMAGE_TAG}"

# Check if image exists
if ! docker image inspect "${FULL_IMAGE_NAME}" &> /dev/null; then
    echo "⚠️  Image ${FULL_IMAGE_NAME} not found"
    echo "Building image first..."
    echo ""
    ./build.sh
    echo ""
fi

# Stop and remove existing container if it exists
if docker ps -a --format '{{.Names}}' | grep -q "^${CONTAINER_NAME}$"; then
    echo "Stopping existing container..."
    docker stop "${CONTAINER_NAME}" || true
    echo "Removing existing container..."
    docker rm "${CONTAINER_NAME}" || true
fi

# Create logs directory if it doesn't exist
mkdir -p logs

echo "Starting container: ${CONTAINER_NAME}"
echo ""

# Start the container
docker run -d \
    --name "${CONTAINER_NAME}" \
    -p 80:80 \
    -p 8000:8000 \
    -p 8001:8001 \
    -v "$(pwd)/.env:/app/.env:ro" \
    -v "$(pwd)/logs:/app/logs" \
    --restart unless-stopped \
    "${FULL_IMAGE_NAME}"

# Wait a moment for services to start
echo "Waiting for services to start..."
sleep 3

# Check if container is running
if docker ps --format '{{.Names}}' | grep -q "^${CONTAINER_NAME}$"; then
    echo ""
    echo "=========================================="
    echo "✅ Container started successfully!"
    echo "=========================================="
    echo ""
    echo "Services are available at:"
    echo "  🌐 Client Web:  http://localhost:80"
    echo "  🔧 Server API:  http://localhost:8000"
    echo "  🔧 Facilitator: http://localhost:8001"
    echo ""
    echo "Useful commands:"
    echo "  View logs:      ./logs.sh"
    echo "  Stop container: ./stop.sh"
    echo "  Restart:        ./stop.sh && ./start.sh"
    echo ""
    echo "Container logs:"
    docker logs --tail 20 "${CONTAINER_NAME}"
else
    echo ""
    echo "❌ Failed to start container"
    echo "Check logs with: docker logs ${CONTAINER_NAME}"
    exit 1
fi
