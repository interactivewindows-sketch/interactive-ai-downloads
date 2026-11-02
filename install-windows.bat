@echo off
chcp 65001 >nul
title interactive ai - instalador
echo === interactive ai: instalador para Windows ===
echo.
where python >nul 2>nul
if errorlevel 1 (echo [1/4] Instalando Python... & winget install -e --id Python.Python.3.12 --accept-package-agreements --accept-source-agreements) else (echo [1/4] Python ya esta instalado.)
where ollama >nul 2>nul
if errorlevel 1 (echo [2/4] Instalando Ollama... & winget install -e --id Ollama.Ollama --accept-package-agreements --accept-source-agreements) else (echo [2/4] Ollama ya esta instalado.)
echo [3/4] Descargando el modelo qwen2.5-coder:1.5b (unos 986 MB)...
ollama pull qwen2.5-coder:1.5b
echo [4/4] Arrancando interactive ai...
start "" http://localhost:8080
python "%~dp0server.py"
pause
