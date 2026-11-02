#!/usr/bin/env bash
# interactive ai - instalador para Linux
set -e
echo "=== interactive ai: instalador para Linux ==="
command -v python3 >/dev/null || { echo "Instala python3 con tu gestor de paquetes."; exit 1; }
if ! command -v ollama >/dev/null; then
  echo "[1/3] Instalando Ollama..."
  curl -fsSL https://ollama.com/install.sh | sh
else
  echo "[1/3] Ollama ya esta instalado."
fi
echo "[2/3] Descargando el modelo qwen2.5-coder:1.5b (unos 986 MB)..."
ollama pull qwen2.5-coder:1.5b
echo "[3/3] Arrancando interactive ai en http://localhost:8080"
cd "$(dirname "$0")"
(sleep 3; xdg-open http://localhost:8080 >/dev/null 2>&1 || true) &
python3 server.py
