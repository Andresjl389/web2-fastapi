# Usa una imagen base de Python más liviana y actual
FROM python:3.10-slim

# Establece el directorio de trabajo dentro del contenedor (usa /app en lugar de /)
WORKDIR /app

# Copia los archivos del proyecto
COPY . .

# Instala las dependencias
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Verifica la estructura de directorios y archivos
RUN ls -la

# Expone el puerto que usa Cloud Run
EXPOSE 8080

# Establece la variable de entorno PORT explícitamente
ENV PORT=8080

# Configuración de Python para encontrar módulos
ENV PYTHONPATH=/app

# Comando para ejecutar el servidor de FastAPI con uvicorn y tiempo de inicio extendido
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080", "--log-level", "debug", "--timeout-keep-alive", "120"]