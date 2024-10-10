# Spiral-PHP-Docker 

Spiral PHP Framework Docker Pack for fast local development via Docker-Compose include:

- PHP 8.3 CLI (with modules *bcmath, gd, intl, mbstring, opcache, pdo, pdo_mysql, pdo_pgsql, sockets, simplexml, xsl, soap, dom, iconv, zip, redis, imagick, xdebug*) + Composer
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
docker-compose run --rm --service-ports -w /app/backend spiral.test bash -c "./rr serve" && docker-compose down

### Bash / CommandLine
docker-compose run --rm -w /app/backend spiral.test bash && docker-compose down

```

### Enviroment

Make changes in .env file (**backend** directory) for connect to PostgreSQL :

```env
# Database
DB_CONNECTION=pgsql
DB_HOST=pgsql
DB_DATABASE=spiral
DB_USERNAME=spiral
DB_PASSWORD=spiral
```

Check connect status:

```bash
make cmd ?CONTAINER_NAME

php app.php db:list

```

> P.S. Don't forget change **.rr.yaml** (*debug: true*) to force worker reload after every request (full debug mode) and limit processing to a single worker. This can be useful for debugging and development purposes (only local dev).

```
http:
  pool:
    debug: true
```

---

# Spiral-PHP-Docker

Рабочее окружение для локальной разработки Spiral PHP Framework в Docker

Включает:

- PHP 8.3 CLI (с модулями *bcmath, gd, intl, mbstring, opcache, pdo, pdo_mysql, pdo_pgsql, sockets, simplexml, xsl, soap, dom, iconv, zip, redis, imagick, xdebug*) + Composer
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
docker-compose run --rm --service-ports -w /app/backend spiral.test bash -c "./rr serve" && docker-compose down

### Bash / консоль
docker-compose run --rm -w /app/backend spiral.test bash && docker-compose down

```

### Правка .env файла

Для нормального коннекта с PostgreSQL нужно поправить **.env** файл в папке **backend**:

```env
# Database
DB_CONNECTION=pgsql
DB_HOST=pgsql
DB_DATABASE=spiral
DB_USERNAME=spiral
DB_PASSWORD=spiral
```

Проверим коннект:

```bash
make cmd ?CONTAINER_NAME

php app.php db:list

```

> P.S. Не забудь поправить **.rr.yaml** и добавить *debug: true* чтобы не перезапускать RoadRunner после каждой правки кода (только для локальной разработки).

```
http:
  pool:
    debug: true
```
