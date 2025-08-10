# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a static file server built with Python and containerized with Docker for learning purposes. The project serves a styled HTML landing page with project documentation and demonstrates Docker containerization concepts with a Python static file server on port 8080.

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
# Expected response: HTML content from static/index.html

# Or open in browser
open http://localhost:8080
```

## Architecture

### Core Components
- **app.py**: Static file server using Python's `SimpleHTTPRequestHandler`
  - Serves files from the `static/` directory on port 8080 (0.0.0.0:8080 for container compatibility)
  - Includes cache-control headers (`no-cache`) for development
  - Automatically creates the static directory if it doesn't exist
- **static/index.html**: Main landing page with styled interface
  - Docker-themed design with blue gradient background
  - Displays project information, tech stack, and Docker commands
  - Responsive design for mobile devices
- **static/style.css**: Styling for the landing page
  - Modern glassmorphism design with backdrop-filter effects
  - Docker blue color scheme (#0db7ed, #2496ed)
  - Responsive layout with mobile breakpoints
- **Dockerfile**: Lightweight build using Python Alpine 3.21 base image
  - Copies both app.py and static/ directory
  - Exposes port 8080 and runs `python app.py`

### Project Structure
```
hello-docker/
├── app.py              # Python static file server
├── Dockerfile          # Container build instructions  
├── static/
│   ├── index.html      # Main landing page
│   └── style.css       # Styling for landing page
├── .github/
│   ├── assets/         # GitHub assets
│   └── CLAUDE.md       # This file
└── README.md           # Project documentation (French)
```

## Technical Details

- **Base Image**: python:alpine3.21
- **Server**: Python SimpleHTTPRequestHandler (stdlib, no external dependencies)
- **Port**: 8080
- **Content**: Static HTML/CSS served from static/ directory
- **Container Size**: ~130MB (estimated)
- **Language**: Project documentation is in French
- **Cache Policy**: No-cache headers for development