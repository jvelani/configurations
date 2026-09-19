#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"

SOURCE="$PROJECT_DIR/configurations/extensions.txt"

if [ ! -f "$SOURCE" ]; then
    echo "Erro: extensions.txt não encontrado:"
    echo "$SOURCE"
    exit 1
fi

echo "Instalando extensões do VS Code..."
echo ""

while IFS= read -r extension || [ -n "$extension" ]; do
    echo ""
    # Ignora linhas vazias
    if [ -z "$extension" ]; then
        continue
    fi

    # Ignora comentários
    if [[ "$extension" == \#* ]]; then
        continue
    fi

    echo "→ Instalando: $extension"

    code --install-extension "$extension" --force

done < "$SOURCE"

echo ""
echo "✓ Extensões instaladas com sucesso!"
