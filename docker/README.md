# Maya1 TTS Docker Deployment

This directory contains the configuration for deploying Maya1 TTS using Docker.

## Prerequisites

- Docker installed
- NVIDIA GPU with drivers installed
- NVIDIA Container Toolkit installed (for GPU support)

## Files

- `Dockerfile`: The Docker image definition.
- `docker-gpu.sh`: Helper script to build and run the container with GPU support.
- `.dockerignore`: Specifies files to exclude from the build context.

## Usage

### Using the helper script

Run the following command from the project root or the `docker` directory:

```bash
./docker/docker-gpu.sh
```

This will:
1. Build the Docker image `maya1-tts`.
2. Run the container with all available GPUs.
3. Expose the API on port 8000.

### Manual Build and Run

**Build:**

```bash
docker build -t maya1-tts -f docker/Dockerfile .
```

**Run:**

```bash
docker run --gpus all --ipc=host -p 8000:8000 maya1-tts
```

## Notes

- The container uses `nvidia/cuda:12.1.1-devel-ubuntu22.04` as the base image.
- It installs Python 3.10 and all dependencies from `requirements.txt`.
- The API is available at `http://localhost:8000`.
- Health check is available at `http://localhost:8000/health`.
