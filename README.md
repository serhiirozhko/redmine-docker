# Redmine docker-compose

## Dockerhost

 - Ubuntu server 22.04
 - Docker 24.0.6, build ed223bc
 - Docker-compose v2.22.0

## Версій сервісів

 - Redmine 5.0.6
 - Mysql CE 5.7.42

## Структура директорій і файлів проекту 

```
.
├── app
│   ├── data
│   │   └── redmine_data
│   ├── Dockerfile
│   ├── redmine_config
│   │   └── configuration.yml
│   ├── redmine_plugins
│   └── redmine_themes
├── db
│   ├── data
│   │   └── mysql_data
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
version: '3.8' # Версія файла
services: # Контейнери які будут запущені
# Опис контейнера Mysql
  db: # Назва служби
    build:
      context: ./db # Вказуєм де шукати Dockerfile для збірки образа 
    image: mysql:${DB_IMG_VER} # Назва яка буде приствоєна образу
    container_name: ${DB_IMG_VER} # Назва яка буде присвоєна контейнеру.
    environment: # Змінні середовища для контейнера
      MYSQL_ROOT_PASSWORD: ${REDMINE_DB_PASSWORD} # Встановлення пароля для кореневого користувача MySQL
      MYSQL_DATABASE: ${REDMINE_DB_NAME} # Встановлення імені для бази даних
    volumes:
      - ./db/data/mysql_data:${DB_DATA} # Монтуємо директорію 'DB_DATA' на хості, для збереження даних.
      - ./db/mysql_config/my.cnf:${DB_CONFIG} # Монтуємо файл конфігурацій.
      - ./initdb:/docker-entrypoint-initdb.d # Заризирвована директорія для ініціалізації бази даних MySQL під час створення контейнера. Файли, розміщені в цій директорії на хості, будуть виконані під час запуску контейнера і можуть містити SQL-запити для створення початкових даних в базі даних.
    healthcheck: # healthcheck це механізм, який допомагає визначити, чи працює контейнер коректно
      test: ["CMD", "mysqladmin", "ping", "-hdb", "-u$REDMINE_DB_USER", "-p$REDMINE_DB_PASSWORD"] # Команда яка перевіряю доступності бази даних.
      interval: 30s # Це параметр вказує, що перевірка повинна запускатися кожні 30 секунд.
      timeout: 10s # Максимальний час очікування для виконання тест.
      retries: 5 # Якщо тест не вдалося виконати успішно, цей параметр вказує, що буде спробовано ще 5 разів перед тим, як контейнер буде визнаний несправним.
      start_period: 60s # Цей параметр вказує, що перевірка не буде запущена протягом перших 60 секунд після запуску контейнера. Це портібно для того щоб контейнері встиг запуститись сервіс.
    logging: # Логування контейнера.
      driver: "json-file" # Ця стрічка вказує, що для логування використовується JSON-файловий драйвер. JSON-файловий драйвер записує логи в JSON-форматі у файлову систему хоста.
      options:
        max-size: "50m" # Вказуємо максимальний розмір кожного лог-файлу.
        max-file: "2" # Вказує максимальну кількість лог-файлів.
        compress: "true" # Цей параметр вказує, що лог-файл має бути стиснутий (архівований)
    networks: # Вказуєм мережу, до якої приєднається контейнер.
      - redmine-network # Назва мережі.
    restart: always # Автоматичний перезапуск в разі якщо він припинить роботу.
# Опис контейнера Redmine
  app: # Назва служби
    build:
      context: ./app # Вказуєм де шукати Dockerfile для збірки образа 
    image: redmine:${REDMINE_IMG_VER} # Назва яка буде приствоєна образу
    container_name: ${REDMINE_IMG_VER} # Назва яка буде присвоєна контейнеру.
    ports: # Мапування портів між хостом та контейнером.
      - 80:3000 # Порт 80 зовнішній порт, 3000 - внутрішній.
    volumes:
      - ./app/redmine_plugins:${REDMINE_PLUGINS} # Монтуємо директорію 'REDMINE_PLUGINS' на хості, для збереження даних плагінів.
      - ./app/redmine_themes:${REDMINE_THEMES} # Монтуємо директорію 'REDMINE_THEMES' на хості, для збереження даних тем.
      - ./app/data/redmine_data:${REDMINE_DATA} # Монтуємо директорію 'REDMINE_DATA' на хості, для збереження даних.
      - ./app/redmine_config/configuration.yml:${REDMINE_CONFIG} # Монтуємо файл конфігурацій, в даному випадку прописана конфігурація для поштового сервира.
    environment: # Змінні середовища для контейнера
      TZ: "Europe/Kiev" #  Встановлює часовий пояс для контейнера.
      LANG: "en_US.utf8" # Встановлює локаль для контейнера
      REDMINE_DB_MYSQL: db # Встановлює ім'я хоста або адресу сервера бази даних, яка пов'язана з контейнером. У нашому випадку, ім'я хоста "db". 
      REDMINE_DB_DATABASE: ${REDMINE_DB_NAME} # Назва бази даних.
      REDMINE_DB_USERNAME: ${REDMINE_DB_USER} # Користувач бази даних.
      REDMINE_DB_PASSWORD: ${REDMINE_DB_PASSWORD} # Пороль користувача бази даних.
    depends_on: # Вказуєм на наявність залежностей для контейнера
      db:
        condition: service_healthy # Цей параметр вказує, що залежність буде враховувати стан контейнера "db". Контейнер Redmine буде чекати, доки контейнер "db" не прйде тест (healthy), перш ніж виконувати свої операції.
    healthcheck: # healthcheck це механізм, який допомагає визначити, чи працює контейнер коректно
      test: ["CMD", "curl", "-f", "http://localhost:3000"] # Команда яка перевіряю доступності сервіса на порту 3000
      interval: 30s # Це параметр вказує, що перевірка повинна запускатися кожні 30 секунд.
      timeout: 10s # Максимальний час очікування для виконання тест.
      retries: 5 # Якщо тест не вдалося виконати успішно, цей параметр вказує, що буде спробовано ще 5 разів перед тим, як контейнер буде визнаний несправним.
    logging: # Логування контейнера.
      driver: "json-file" # Ця стрічка вказує, що для логування використовується JSON-файловий драйвер. JSON-файловий драйвер записує логи в JSON-форматі у файлову систему хоста.
      options:
        max-size: "50m" # Вказуємо максимальний розмір кожного лог-файлу.
        max-file: "2" # Вказує максимальну кількість лог-файлів.
        compress: "true" # Цей параметр вказує, що лог-файл має бути стиснутий (архівований)
    networks: # Вказуєм мережу, до якої приєднається контейнер.
      - redmine-network # Назва мережі.
    restart: always # Автоматичний перезапуск в разі якщо він припинить роботу.
    
networks: # Цей фрагмент конфігурації визначає мережу з назвою "redmine-network" і встановлює для неї драйвер "bridge", І визначає мережу як глобальну, до якої можуть приєднатися всі контейнери в проекті.
  redmine-network:
    driver: bridge
```
В директоріях ./app і ./db є Dockerfile - це конфігураційні файли, які містить інструкції для створення образів, в даному випадку використовуються официйні образи redmine і mysql-ce.

## Опис файла .env 
Файл .env використовується для зберігання змінних середовища, які використвуються в Docker Compose конфігурації.

## Основні команди Docker Compose

Запуск крнтейнерів на основі конфігурації, виконувати в директорій знаходження docker-compose файла
```
docker-compose up
```
Ця команда зупиняє та видаляє всі контейнери, які були створені з `docker-compose up`.
```
docker-compose down
```
Ця команда виводить інформацію про статус контейнерів.
```
docker-compose ps
```
Ця команда дозволяє переглядати журнали логів для сервісів.
```
docker-compose logs container_name
```
Ця команда дозволяє підєднатися до контейнера.
```
docker-compose exec -it container_name /bin/bash
```
Ця команда виконує збірку образів
```
docker-compose build
```
Ця команда запускає контейнери в фоновому режимі (без виводу їхніх логів в термінал).
```
docker-compose up -d
```
Ця команда зупиняє контейнери, але залишає їх у стані, в якому вони можуть бути запущені пізніше.
```
docker-compose stop
```
Ця команда стартує контейнери, якщо вони були раніше зупинені, не перезапускаючи їх.
```
docker-compose start
```
Ця команда перезапускає контейнери.
```
docker-compose restart
```
Ця команда виводить журнали логів у режимі живого виведення (live mode)
```
docker-compose logs -f 
```
> Примітка: Завантажити шаблон для розгортання сервісу `git clone https://github.com/serhiirozhko/redmine-docker.git`

## Скрипт для створеня резервних копій бази даних та файлів redmine

```bash
#!/bin/bash
# Шлях до файлу .env
export DOTENV=/home/pronetware/bkp/bkp-redmine-docker/.env
# Завантаження змінних оточення з .env
if [ -f "$DOTENV" ]; then
  source "$DOTENV"
# Шлях до каталогу з резервними копіями бази даних
  backup_dir_db="/var/backup-redmine-sc/db/"
# Шлях до каталогу з резервними копіями файлів
  backup_dir_files="/var/backup-redmine-sc/files/"
# Кількість днів, протягом яких резервні копії будуть зберігатися
  days_to_keep=10
# Створення директорій для резервних копій, якщо вони не існують
  if [ ! -d "$backup_dir_db" ]; then
    mkdir -p "$backup_dir_db"
  fi

  if [ ! -d "$backup_dir_files" ]; then
    mkdir -p "$backup_dir_files"
  fi

# Ім'я файлу для резервної копії
  backup_file="$DB_IMG_VER-$(date +%Y-%m-%d_%H-%M).sql"
# Виконуємо mysqldump і перенаправляємо виведення у тимчасовий файл
  temp_file="/tmp/temp_backup.sql"
  docker exec $DB_IMG_VER /usr/bin/mysqldump $REDMINE_DB_NAME > "$temp_file"

  if [ $? -eq 0 ]; then
    # Якщо mysqldump успішно завершив роботу, переміщуємо тимчасовий файл у місцезнаходження резервної копії
    mv "$temp_file" "$backup_dir_db$backup_file"
    echo ""The database backup has been successfully created.""
  else
    # Якщо mysqldump завершив роботу з помилкою, видаляємо тимчасовий файл
    rm -f "$temp_file"
    echo "Error occurred while creating a database backup."
  fi

  if [ -n "$(find "$backup_dir_db" -type f -mtime +"$days_to_keep")" ]; then
    find "$backup_dir_db" -type f -mtime +"$days_to_keep" -exec rm {} \;
    echo "The database backup files have been successfully deleted."
  else
    echo "There are no database backup files to delete."
  fi

  # Використання команди rsync для копіювання даних
  rsync -av /home/pronetware/bkp/bkp-redmine-docker/app/data/redmine_data $backup_dir_files
else
  echo "Файл .env не найден."
fi
```
