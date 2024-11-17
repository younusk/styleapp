# syntax=docker/dockerfile:1
FROM python:3.9-slim
WORKDIR /app
COPY . /app
RUN pip install Flask
EXPOSE 5000
CMD ["python", "styleapp.py", "--host=0.0.0.0"]
