#!/bin/bash

filtered_modules=$(cat json.json | jq -rc 'to_entries | map(select(.value == true)) | map({module: .key})')

matrix="{\"include\":$filtered_modules}"

# # 백슬래시 두 번 사용하여 escape 문자 포함
# matrix_with_escape="{\\\"include\\\":$filtered_modules}"

# echo "matrix=$matrix"
# echo "matrix_with_escape=$matrix_with_escape"


# sed 명령어를 사용하여 "를 \"로 바꾸기
matrix_with_sed=$(echo "$matrix" | sed 's/"/\\\"/g')

echo "matrix=$matrix"
echo "matrix_with_sed=$matrix_with_sed"