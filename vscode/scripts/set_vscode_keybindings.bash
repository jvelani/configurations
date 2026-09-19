#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"

SOURCE="$PROJECT_DIR/configurations/keybindings.json"

WIN_USER=$(cmd.exe /C "echo %USERNAME%" 2>/dev/null | tr -d '\r')

TARGET="/mnt/c/Users/$WIN_USER/AppData/Roaming/Code/User/keybindings.json"

if [ ! -f "$SOURCE" ]; then
    echo "Erro: keybindings.json não encontrado:"
    echo "$SOURCE"
    exit 1
fi

mkdir -p "$(dirname "$TARGET")"

if [ -f "$TARGET" ]; then
    echo "⚠ Sobrescrevendo keybindings.json existente..."
fi

cp "$SOURCE" "$TARGET"

echo "✓ VS Code keybindings aplicados com sucesso!"
echo ""
echo "Origem:"
echo "$SOURCE"
echo ""
echo "Destino:"
echo "$TARGET"