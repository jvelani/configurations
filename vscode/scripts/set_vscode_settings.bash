#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"

SOURCE="$PROJECT_DIR/configurations/settings.json"

WIN_USER=$(cmd.exe /C "echo %USERNAME%" 2>/dev/null | tr -d '\r')

TARGET="/mnt/c/Users/$WIN_USER/AppData/Roaming/Code/User/settings.json"

if [ ! -f "$SOURCE" ]; then
    echo "Erro: settings.json não encontrado:"
    echo "$SOURCE"
    exit 1
fi

mkdir -p "$(dirname "$TARGET")"

cp "$SOURCE" "$TARGET"

echo "✓ VS Code settings aplicados com sucesso!"
echo ""
echo "Origem:"
echo "$SOURCE"
echo ""
echo "Destino:"
echo "$TARGET"
