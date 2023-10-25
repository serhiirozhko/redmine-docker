#!/bin/bash
# Шлях до файлу .env
export DOTENV=/home/pronetware/project/new/redmine-docker/.env
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
  backup_file="$DB_IMG_VER-$(date +%Y-%m-%d:%H-%M).sql"
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
  rsync -av /home/pronetware/project/new/redmine-docker/app/data/redmine_data $backup_dir_files
else
  echo "Файл .env не найден."
fi
