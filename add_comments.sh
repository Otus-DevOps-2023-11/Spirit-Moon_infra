#!/bin/bash

files=(
  "terraform/modules/app/main.tf"
  "terraform/modules/db/main.tf"
  "terraform/main.tf"
  "terraform/stage/main.tf"
  "terraform/prod/main.tf"
)

for file in "${files[@]}"
do
  if [ -f "$file" ]; then
    sed -i '1,9 s/^/#/' "$file"
    echo "Символ '#' установлен в начале первых 9 строк файла: $file"
  else
    echo "Файл не найден: $file"
  fi
done
