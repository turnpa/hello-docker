FROM python:3.13.5
WORKDIR /app
COPY app.py .
EXPOSE 8080

# Labels pour GitHub Container Registry
LABEL org.opencontainers.image.title="Hello Docker"
LABEL org.opencontainers.image.description="Serveur HTTP Python simple pour apprendre Docker"
LABEL org.opencontainers.image.url="https://turnpa.github.io/hello-docker/"
LABEL org.opencontainers.image.source="https://github.com/turnpa/hello-docker"
LABEL org.opencontainers.image.vendor="turnpa"
LABEL org.opencontainers.image.licenses="MIT"

CMD ["python", "app.py"]
