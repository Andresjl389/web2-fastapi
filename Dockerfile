# Usa una imagen base de Python más liviana y actual
FROM python:3.10-slim

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia el código y el archivo .env
COPY . .

# Instala las dependencias
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt --use-deprecated=legacy-resolver

# Ejecuta las migraciones (si usas Alembic)
# RUN alembic upgrade head

# Expone el puerto que usa Cloud Run
EXPOSE 8080

# Comando para ejecutar el servidor de FastAPI con uvicorn
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]
