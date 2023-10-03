#!/bin/bash

# Функция для очистки папок
cleanup_folders() {
    local folder=$1

    # Поиск подпапок размером более 400 МБ
    subfolders=$(find "$folder" -mindepth 1 -maxdepth 1 -type d -size +400M)

    # Проверка наличия подпапок
    if [[ -n $subfolders ]]; then
        newest_folder=""
        newest_date=0

        # Поиск подпапки с самой новой датой изменения
        for subfolder in $subfolders; do
            subfolder_date=$(stat -c %Y "$subfolder")

            if (( subfolder_date > newest_date )); then
                newest_date=$subfolder_date
                newest_folder=$subfolder
            fi
        done

        # Удаление всех подпапок, кроме папки с самой новой датой изменения
        find "$folder" -mindepth 1 -maxdepth 1 -type d -not -path "$newest_folder" -exec rm -rf {} \;
    fi
}

# Бесконечный цикл проверки доступного места
while true; do
    # Получение размера домашней папки
    folder_size=$(du -s ~/ | awk '{print $1}')

    # Проверка размера
    if (( folder_size < 1024 )); then
        # Запуск функции очистки
        cleanup_folders ~/
    fi

    # Пауза в 1 минуту
    sleep 60
done