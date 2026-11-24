# Hola Docker

Proyecto de Django que se ejecuta dentro de un contenedor con Docker y Docker Compose (práctica 9).

## Archivos

| Archivo | Para qué sirve |
|---|---|
| `Dockerfile` | Construye la imagen a partir de `python:3.13-slim-trixie`. Copia `requirements.txt` e instala las dependencias antes de copiar el código, para aprovechar la caché de capas. |
| `.dockerignore` | Evita copiar a la imagen carpetas como `.venv` y `.git`. |
| `compose.yaml` | Define el servicio `web`: construye la imagen, monta el proyecto como volumen y publica el puerto 8080. |

## Cómo ejecutarlo

```bash
docker compose up --build
```

Después abre http://127.0.0.1:8080/ y debe aparecer "¡Hola desde Docker!". Para detenerlo, `Ctrl+C` (o `docker compose down`).

## Notas

- El puerto `8080:8000` conecta el puerto 8080 de la computadora con el 8000 del contenedor.
- El servidor se inicia con `runserver 0.0.0.0:8000`. Sin `0.0.0.0`, Django solo escucha en el `127.0.0.1` del contenedor y el navegador no puede conectarse.
- El volumen `.:/code` hace que los cambios en el código se vean sin reconstruir la imagen.
