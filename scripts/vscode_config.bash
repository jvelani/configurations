#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"

VSCODE_SCRIPTS="$PROJECT_DIR/vscode/scripts"

echo "======================================"
echo "       VS Code Environment Setup"
echo "======================================"
echo ""

echo ""
echo "1/3 - Instalando extensões..."
bash "$VSCODE_SCRIPTS/install_vscode_extensions.bash"

echo "2/3 - Aplicando settings..."
bash "$VSCODE_SCRIPTS/set_vscode_settings.bash"

echo ""
echo "3/3 - Aplicando keybindings..."
bash "$VSCODE_SCRIPTS/set_vscode_keybindings.bash"

echo ""
echo "======================================"
echo "✓ VS Code configurado com sucesso!"
echo "======================================"
