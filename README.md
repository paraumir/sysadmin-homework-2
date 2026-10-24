 Sysadmin Homework 2

Практическая работа по системному администрированию на Ubuntu 22.04.

 Часть 1. Docker, RAID1 и LVM

 Docker

Создан Docker-образ sysadmin-monitor на основе Ubuntu 22.04.

В контейнере:
- Устанавливается Python 3.
- Запускается скрипт мониторинга script.sh.
- Запускается HTTP-сервер на порту 8080.
- Лог мониторинга сохраняется на хосте через bind mount.

Сборка образа:

bash
sudo docker build -t sysadmin-monitor .
