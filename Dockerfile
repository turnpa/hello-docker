FROM python:alpine3.21


WORKDIR /app

COPY app.py .
COPY static/ ./static/

EXPOSE 8080

CMD ["python", "app.py"]
