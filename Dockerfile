# Temel imaj: Python 3.9 + Alpine 3.13
FROM python:3.9-alpine3.13
# Bakımcı bilgisi
LABEL maintainer="Dilan-nihadioglu"

# Python log çıktısı tamponlanmasın
ENV PYTHONUNBUFFERED=1

# Gereksinim dosyasını kopyala
COPY ./requirements.txt /tmp/requirements.txt

# Gereksinim dosyasını kopyala
COPY ./requirements.dev.txt /tmp/requirements.dev.txt

# Uygulama dosyalarını kopyala
COPY ./app /app

# Çalışma dizinini ayarla
WORKDIR /app

# Portu aç
EXPOSE 8000

ARG DEV=false

# Sanal ortam oluştur
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

# PATH ortam değişkenini ayarla
ENV PATH="/py/bin:$PATH"

# Django-user olarak çalıştır
USER django-user
