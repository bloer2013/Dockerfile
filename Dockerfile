# Используем официальный базовый образ с Python
FROM python:3.9-slim

# Обновление пакетов и установка git, wget, и других необходимых инструментов
RUN apt-get update && \
    apt-get install -y \
    git \
    wget \
    && apt-get clean

# Установка pip3 и обновление его до последней версии
RUN pip install --upgrade pip

# Установка необходимых Python библиотек
RUN pip install \
    configparser~=7.0.1 \
    ipaddress~=1.0.23 \
    dnspython~=2.6.1 \
    httpx~=0.27.0 \
    colorama~=0.4.6 \
    requests \
    progress \
    telegram \
    dnspython

# Создаем директорию для репозиториев
RUN mkdir -p /app

# Переход в рабочую директорию /app
WORKDIR /app

# Клонируем два указанных репозитория
RUN git clone https://github.com/Ground-Zerro/DomainMapper.git
RUN wget https://raw.githubusercontent.com/bloer2013/python-docker/main/send.py /app/send.py

# Устанавливаем рабочую директорию для выполнения команд
WORKDIR /app

# Указываем, что контейнер будет выполняться интерактивно
CMD ["/bin/bash"]
