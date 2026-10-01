#!/bin/bash
# Inicia o Letra Viva em http://127.0.0.1:8888
cd "$(dirname "$0")"
( sleep 1; open "http://127.0.0.1:8888/" ) &
echo "Letra Viva rodando em http://127.0.0.1:8888  (feche esta janela para parar)"
python3 -m http.server 8888 --bind 127.0.0.1
