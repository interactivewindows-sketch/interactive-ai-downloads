#!/usr/bin/env bash
# interactive ai - instalador para macOS (doble clic)
cd "$(dirname "$0")"
echo "=== interactive ai: instalador para macOS ==="
if ! command -v ollama >/dev/null; then
  if command -v brew >/dev/null; then
    echo "[1/3] Instalando Ollama con Homebrew..."
    brew install ollama
  else
    echo "Descarga Ollama desde https://ollama.com/download, instalala, y vuelve a abrir este archivo."
    open "https://ollama.com/download"; read -p "Enter para salir..."; exit 1
  fi
else
  echo "[1/3] Ollama ya esta instalado."
fi
echo "[2/3] Descargando el modelo qwen2.5-coder:1.5b (unos 986 MB)..."
ollama pull qwen2.5-coder:1.5b
echo "[3/3] Arrancando interactive ai en http://localhost:8080"
(sleep 3; open http://localhost:8080) &
python3 server.py
