#!/bin/bash

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}Building Maya1 TTS Docker Image...${NC}"

# Navigate to project root
cd "$(dirname "$0")/.."

# Build the image
docker build -t maya1-tts -f docker/Dockerfile .

if [ $? -eq 0 ]; then
    echo -e "${GREEN}Build successful!${NC}"
    echo -e "${BLUE}Starting container with GPU support...${NC}"
    
    # Run the container
    docker run --gpus all \
        --ipc=host \
        -p 8000:8000 \
        --name maya1-tts-server \
        --rm \
        -it \
        maya1-tts
else
    echo -e "\033[0;31mBuild failed!${NC}"
    exit 1
fi
