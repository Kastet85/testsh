#!/bin/bash

set -e

# Получает текущую рабочую директорию проекта.
CURRENT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

print_help()
{
  echo "-s, --set-version               указать номер версии"
  echo "-h, --help                      отобразить текущую помощь"
}

# Обработчик аргументов
while [[ "$#" -gt 0 ]]; do
  case "${1}" in
    -s|--set-version) export VERSION="${2}"; shift; shift ;;
    -h|--help) print_help; exit 1 ;;
    *) echo "Неизвестный параметр: $1"; exit 1 ;;

  esac
done

build()
{
echo "$VERSION"
}

main()
{
  if [ ${VERSION} ]; then
    build
  fi
}

main "$@"
