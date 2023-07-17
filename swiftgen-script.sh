#!/bin/bash
# скрипт для обхода локальных модулей и вызова swiftgen

# Функция для вызова swiftgen в текущей директории
function run_swiftgen {
  echo "Running swiftgen in $1"
  cd "$1" || return
    swiftgen
  cd - || return
}

# Обход всех папок рекурсивно и выполнение swiftgen, если найден swiftgen.yml
find . -name "swiftgen.yml" | while read -r filepath; do
  directory=$(dirname "$filepath")
  run_swiftgen "$directory"
done
