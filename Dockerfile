# Docker-команда FROM вказує базовий образ контейнера
# slim - мінімальний образ
FROM python:3.11-slim

# Встановимо змінну середовища
# ENV APP_HOME /app

# Встановимо робочу директорію всередині контейнера
# WORKDIR $APP_HOME
WORKDIR .

# Встановити poetry
RUN pip install poetry

# 
COPY pyproject.toml .
COPY poetry.lock .

# Встановимо залежності всередині контейнера
RUN poetry install

# Скопіюємо інші файли в робочу директорію контейнера
COPY . .

# Позначимо порт, де працює застосунок всередині контейнера
EXPOSE 8000

# Запустимо наш застосунок всередині контейнера
ENTRYPOINT ["poetry", "run", "python", "main.py"]
