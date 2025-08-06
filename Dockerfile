FROM python:3.13.5

WORKDIR /app

COPY app.py .

EXPOSE 8080

CMD ["python", "app.py"]
