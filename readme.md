# ДЗ Тема: Основи технології Docker

Створіть віртуальне оточення то встановіть необхідні бібліотеки

```bash
pip install -r requirements.txt
```

Запуск:

```bash
python main.py
```

# Рішення

## 1. Створюємо віртуальне оточення

```sh
poetry init
```

Створити env з іншим інтерпретатором

```sh
poetry env use /path/to/preferred/python/version/python.exe
```

Для встановлення пакетів з 'requirements.txt':

1. залишити в фалі requirements.txt тільки назви пакетів, кожен з нового рядка
2. запустити
   `poetry add $(cat requirements.txt)`
   що встановить всі пакети по черзі

## Docker

Запустити всі контейнера

```sh
docker compose up --build -d
```

`--build` - примусово ребілд кожного разу

показати запущені контейнери

```sh
$ docker ps
CONTAINER ID   IMAGE                               COMMAND                  CREATED          STATUS          PORTS
      NAMES
894f8ddb80d3   fullstack-web-development-hw2-web   "poetry run python m…"   55 seconds ago   Up 53 seconds   0.0.0.0:8000->8000/tcp   fullstack-web-development-hw2-web-1
90219fe187f5   postgres:16                         "docker-entrypoint.s…"   2 minutes ago    Up 54 seconds   0.0.0.0:5432->5432/tcp   fullstack-web-development-hw2-postgres-1
```

підключитись до контейнера
`docker attach 89`
де 89 = id контейнера з першої команди

подивитись логи контейнера

```sh
docker logs 89
```

Зупинити контейнер

```sh
docker compose down
```
