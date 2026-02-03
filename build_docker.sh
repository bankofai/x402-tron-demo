#!/bin/bash
set -e

echo "=========================================="
echo "Building x402-tron-demo Docker Image"
echo "=========================================="

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    echo "❌ Error: Docker is not installed"
    echo "Please install Docker from https://www.docker.com/"
    exit 1
fi

# Check if .env file exists
if [ ! -f ".env" ]; then
    echo "⚠️  Warning: .env file not found"
    echo "Creating .env.example as reference..."
    cat > .env.example << 'EOF'
# TRON Private Key for facilitator
TRON_PRIVATE_KEY=your_private_key_here

# Payment recipient address
PAY_TO_ADDRESS=your_tron_address_here
EOF
    echo "✓ Created .env.example"
    echo ""
    echo "Please create .env file with your configuration:"
    echo "  cp .env.example .env"
    echo "  # Then edit .env with your actual values"
    echo ""
fi

# Get image name and tag
IMAGE_NAME="${IMAGE_NAME:-x402-tron-demo}"
IMAGE_TAG="${IMAGE_TAG:-latest}"
FULL_IMAGE_NAME="${IMAGE_NAME}:${IMAGE_TAG}"

echo "Building Docker image: ${FULL_IMAGE_NAME}"
echo ""

# Build the image
docker build \
    --tag "${FULL_IMAGE_NAME}" \
    --file Dockerfile \
    .

if [ $? -eq 0 ]; then
    echo ""
    echo "=========================================="
    echo "✅ Build successful!"
    echo "=========================================="
    echo "Image: ${FULL_IMAGE_NAME}"
    echo ""
    echo "Next steps:"
    echo "  1. Ensure .env file is configured"
    echo "  2. Run: ./start.sh"
    echo ""
else
    echo ""
    echo "❌ Build failed!"
    exit 1
fi
