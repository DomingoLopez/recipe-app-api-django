FROM python:3.9-alpine3.13
LABEL maintainer="domisindahouse"

ENV PYTHONUNBUFFERED 1
COPY ./requirements.txt /tmp/requirements.txt
COPY ./requirements.dev.txt /tmp/requirements.dev.txt
COPY ./app /app 
WORKDIR /app
EXPOSE 8000

# Argumento DEV=False. Si lanzamos este DockerFile sin más estaremos en modo producción,
# Si lanzamos el docker-compose machacará el DEV=true que tiene el docker-compose. 
# Vemos si estamos en DEV o no con $DEV e instalamos los requirements necesarios de dev.
# OJITO con el shell. [ $DEV = "true"] <- MAL. No hay espacio después de "true", y da error.
ARG DEV=false
RUN python -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    /py/bin/pip install -r /tmp/requirements.txt && \
    if [ $DEV = "true" ]; \
        then /py/bin/pip install -r /tmp/requirements.dev.txt ; \
    fi && \
    rm -rf /tmp && \
    adduser \
        --disabled-password \
        --no-create-home \
        django-user

ENV PATH="/py/bin:$PATH"

USER django-user