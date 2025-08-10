# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a simple Python HTTP server containerized with Docker for learning purposes. The project demonstrates basic Docker containerization concepts with a minimal Python web server that responds with "Hello Docker!" on port 8080.

## Development Commands

### Docker Commands
```bash
# Build the Docker image
docker build -t hello-docker .

# Run the container (development)
docker run -p 8080:8080 hello-docker

# Run container in background
docker run -d -p 8080:8080 --name mon-hello hello-docker

# View container logs
docker logs mon-hello

# Stop and remove container
docker stop mon-hello
docker rm mon-hello
```

### Testing
```bash
# Test the server is running (after container start)
curl http://localhost:8080
# Expected response: "Hello Docker!"
```

## Architecture

### Core Components
- **app.py**: Simple HTTP server using Python's built-in `BaseHTTPRequestHandler`
  - Serves on port 8080 (0.0.0.0:8080 for container compatibility)
  - Returns plain text "Hello Docker!" response to all GET requests
- **Dockerfile**: Multi-stage build using Python 3.13.5 base image
  - Copies only app.py to minimize image size (~130MB final)
  - Exposes port 8080 and runs `python app.py`
- **index.html**: Static landing page (not served by app.py)
  - Contains project documentation and Docker commands
  - Includes OpenGraph meta tags for GitHub Pages

### Project Structure
```
hello-docker/
├── app.py          # Python HTTP server
├── Dockerfile      # Container build instructions  
├── index.html      # Static documentation page
└── README.md       # Project documentation (French)
```

## Technical Details

- **Base Image**: python:3.13.5
- **Server**: Python BaseHTTPServer (stdlib, no external dependencies)
- **Port**: 8080
- **Response**: Plain text "Hello Docker!"
- **Container Size**: ~130MB
- **Language**: Project documentation is in French