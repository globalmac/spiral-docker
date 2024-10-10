# Spiral-PHP-Docker / Spiral PHP Framework Docker Pack for fast local development via Docker-Compose
Spiral PHP Framework Dockerized Pack include:

- PHP 8.3 CLI (with modules *pdo_pgsql pgsql pdo_mysql mbstring exif pcntl bcmath gd sockets*) + Composer
- PostgreSQL 15
- RoadRunner server-side

### Usage

> You need run install once and after you can start RoadRunner server viw serve command.

#### MakeFile examples:

> CONTAINER_NAME - optional, default **spiral.test**

1) Install:

```bash
make install ?CONTAINER_NAME
```

2) Serve:

```bash
make serve ?CONTAINER_NAME
```

Bash (for run Composer commands, RoadRunner and etc):

```bash
make cmd ?CONTAINER_NAME
```

---

#### Or BASH examples:

```bash
### Install
docker-compose run --rm -w /app spiral.test bash -c "composer create-project spiral/app backend && cd backend && chmod +x rr" && docker-compose down

### Serve
docker-compose run --rm --service-ports -w /app/backend $(C) bash -c "./rr serve" && docker-compose down

### Bash / CommandLine
docker-compose run --rm -w /app/backend $(C) bash && docker-compose down

```

---

# Spiral-docker / Рабочее окружение для локальной разработки Spiral PHP Framework в Docker

Включает:

- PHP 8.3 CLI (с модулями *pdo_pgsql pgsql pdo_mysql mbstring exif pcntl bcmath gd sockets*) + Composer
- PostgreSQL 15
- Все запускается через RoadRunner


### Использование

> Нужно 1 раз установить всё через *install* и далее запускать *serve* и *cmd* (для доступа в консоль с композером и проектом)

#### MakeFile примеры:

> CONTAINER_NAME - опционально, по-умолчанию контейнер - **spiral.test**

1) Установка:

```bash
make install ?CONTAINER_NAME
```

2) Запуск:

```bash
make serve ?CONTAINER_NAME
```

Консоль (для работы с Composer и php app.php ..., RoadRunner и т.д.):

```bash
make cmd ?CONTAINER_NAME
```

---

#### Или BASH:

```bash
### Установка (разово)
docker-compose run --rm -w /app spiral.test bash -c "composer create-project spiral/app backend && cd backend && chmod +x rr" && docker-compose down

### Запуск (RoadRunner)
docker-compose run --rm --service-ports -w /app/backend $(C) bash -c "./rr serve" && docker-compose down

### Bash / консоль
docker-compose run --rm -w /app/backend $(C) bash && docker-compose down

```
