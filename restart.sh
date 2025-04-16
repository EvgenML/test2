#!/bin/bash

# Название процесса, по которому будем искать бота
PROCESS_NAME="python.*main.py"
VENV_PATH="./bot_venv/bin/activate"
SCRIPT_PATH="main.py"

echo "Ищем процесс..."

PID=$(pgrep -f "$PROCESS_NAME")

if [ -n "$PID" ]; then
  echo "Проект уже запущен (PID=$PID), останавливаем..."
  kill "$PID"
  sleep 1
else
  echo "Проект не запущен."
fi

echo "Активируем виртуальное окружение..."
source "$VENV_PATH"

echo "Запускаем $SCRIPT_PATH..."
nohup python "$SCRIPT_PATH" > bot.log 2>&1 &
echo "Готово! Новый PID: $!"
