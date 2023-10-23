# Redmine docker-compose
## Server software version
 - Ubuntu server 22.04
 - Docker 24.0.6, build ed223bc
 - Docker-compose v2.22.0
## Application version
 - Redmine 5.0.6
 - Mysql CE 5.7.42

## Project structure 

```
├── app
│   ├── data
│   │   └── redmine_data
│   ├── Dockerfile
│   ├── redmine_config
│   │   └── configuration.yml
│   ├── redmine_plugins
│   └── redmine_themes
├── db
│   ├── Dockerfile
│   └── mysql_config
│       └── my.cnf
├── docker-compose.yaml
├── initdb
├── README.md
├── script
   └── backup.sh
```
## Опис файла docker-compose.yaml
```yaml
version: '3.8' Версія файла
services: #Контейнери які будут запущені
# MySQL database custom images
  db:
    build:
      context: ./db
    image: mysql:${DB_IMG_VER}
    container_name: ${DB_IMG_VER}
    environment:
      MYSQL_ROOT_PASSWORD: ${REDMINE_DB_PASSWORD}
      MYSQL_DATABASE: ${REDMINE_DB_NAME}
    volumes:
      - ./db/data/mysql_data:${DB_DATA}
      - ./db/mysql_config/my.cnf:${DB_CONFIG}
      - ./initdb:/docker-entrypoint-initdb.d
    healthcheck:
      test: ["CMD", "mysqladmin", "ping", "-hdb", "-u$REDMINE_DB_USER", "-p$REDMINE_DB_PASSWORD"]
      interval: 30s
      timeout: 10s
      retries: 5
      start_period: 60s
    logging:
      driver: "json-file"
      options:
        max-size: "50m"
        max-file: "2"
        compress: "true"
    networks:
      - redmine-network
    restart: always
# Redmine custom images
  app:
    build:
      context: ./app
    image: redmine:${REDMINE_IMG_VER}
    container_name: ${REDMINE_IMG_VER}
    ports:
      - 80:3000
    volumes:
      - ./app/redmine_plugins:${REDMINE_PLUGINS}
      - ./app/redmine_themes:${REDMINE_THEMES}
      - ./app/data/redmine_data:${REDMINE_DATA}
      - ./app/redmine_config/configuration.yml:${REDMINE_CONFIG}
    environment:
      TZ: "Europe/Kiev"
      LANG: "en_US.utf8"
      REDMINE_DB_MYSQL: db
      REDMINE_DB_DATABASE: ${REDMINE_DB_NAME}
      REDMINE_DB_USERNAME: ${REDMINE_DB_USER}
      REDMINE_DB_PASSWORD: ${REDMINE_DB_PASSWORD}
    depends_on:
      db:
        condition: service_healthy
    healthcheck:
      test: ["CMD", "curl", "-f", "http://localhost:3000"]
      interval: 30s
      timeout: 10s
      retries: 5
    logging:
      driver: "json-file"
      options:
        max-size: "50m"
        max-file: "2"
        compress: "true"
    networks:
      - redmine-network
    restart: always

networks:
  redmine-network:
    driver: bridge
```






# ./app
 - Директорія `data > redmine_data` монтується через docker volume до директорій `/usr/src/redmine/files` всередині контейнера, ця директорія потрібна для збереженя файлів проєктів.
 - Директорія `redmine_config` і файл `configuration.yml` створюється вручну, файл `configuration.yml` містить в цьому випадку конфігурацію поштового сервера, монтується через docker volume до директорій `/usr/src/redmine/config/configuration.yml`
 - Директорій `redmine_plugins` монтується через docker volume до директорій `/usr/src/redmine/plugins` ця директорія потрібна для підключення і збереження плагінів.
 - Директорій `redmine_themes`  монтується через docker volume до директорій `/usr/src/redmine/public/themes` ця директорія потрібна для підключення і збереження тем.

Dockerfile - потрібен для бідла образа який будується на орігінальному образі redmine і вразі необхідності в нього можна буде внести зміни, наприклад встановити залежності для плагінів.
# ./db
 -   Директорія `data > mysql_data` монтується через docker volume до директорій `/var/lib/mysql` всередині контейнера, ця директорія потрібна для збереженя всіх файлів бази даних.
 - Директорія `mysql_config` і файл `my.cnf` створюється вручну, файл `my.cnf` містить конфігурацію бази даних, монтується через docker volume до директорій `/etc/mysql/my.cnf`

Dockerfile - потрібен для бідла образа який будується на орігінальному образі mysql і вразі необхідності в нього можна буде внести зміни.
