# Dockerfile
# Imagen base
FROM python:3.13-slim-trixie

# Variables de entorno
ENV PIP_DISABLE_PIP_VERSION_CHECK=1
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Carpeta de trabajo
WORKDIR /code

# Dependencias
COPY ./requirements.txt .
RUN pip install -r requirements.txt

# Código del proyecto
COPY . .