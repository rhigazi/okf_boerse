#!/bin/zsh

current_dir=$(pwd)
folder_name=$(basename "$current_dir")

HOST_CONFIG_PATH="$HOME/.dirac/config.json"
CONTAINER_TARGET_PATH="/root/.dirac/config.json"

# Pfade für die neue globalState.json
HOST_GLOBAL_STATE="$current_dir/globalState.json"
CONTAINER_GLOBAL_STATE="/root/.dirac/data/globalState.json"

echo "🚀 Starte isolierten Container '$folder_name' für Dirac-CLI..."

# Verhindert Fehler, falls die lokale Config fehlt
if [ ! -f "$HOST_CONFIG_PATH" ]; then
    mkdir -p "$(dirname "$HOST_CONFIG_PATH")"
    echo "{}" > "$HOST_CONFIG_PATH"
fi

# Prüfen, ob globalState.json im aktuellen Verzeichnis existiert
VOLUME_GLOBAL_STATE_ARG=""
if [ -f "$HOST_GLOBAL_STATE" ]; then
    VOLUME_GLOBAL_STATE_ARG="-v $HOST_GLOBAL_STATE:$CONTAINER_GLOBAL_STATE"
    echo "📄 'globalState.json' gefunden und für den Container vorbereitet."
else
    echo "⚠️  Hinweis: Keine 'globalState.json' im aktuellen Verzeichnis gefunden. Überspringe Mount."
fi

# Docker Start
docker run -it --rm \
  --name "$folder_name" \
  -v "$current_dir":/app \
  -v "$HOST_CONFIG_PATH":"$CONTAINER_TARGET_PATH" \
  ${=VOLUME_GLOBAL_STATE_ARG} \
  -w /app \
  -e OPENAI_API_BASE="http://host.docker.internal:1234/v1" \
  -e OPENAI_MODEL_NAME="gemma-4-26b-a4b-it" \
  -e OPENAI_API_KEY="lm-studioLocal" \
  --add-host=host.docker.internal:host-gateway \
  nikolaik/python-nodejs:python3.12-nodejs22-slim \
 bash -c "
    {
      echo '# Docker Start-Protokoll'
      echo 'Zeitstempel: '\$(date)
      echo ''
      
      # Sicherstellen, dass das Zielverzeichnis für Daten existiert
      mkdir -p /root/.dirac/data
      
      echo '## 1. System-Tools und DuckDB CLI installieren'
      apt-get update -y && apt-get install -y -qq git curl mc wget jq procps unzip > /dev/null
      
      curl -fsSL https://pi.dev/install.sh | sh
      cp ./models.json /root/.pi/agent
      
      # DuckDB via offizieller Pipe installieren & Pfad setzen
      curl -fsSL https://install.duckdb.org | sh
      export PATH=\"/root/.duckdb/cli/latest:\$PATH\"
      echo 'export PATH=\"/root/.duckdb/cli/latest:\$PATH\"' >> /root/.bashrc
      
      echo ''
      echo '## 2. Globales Dirac-CLI Setup (Node v22)'
      npm install -g dirac-cli -qq
      npm install -g @google/jules
      echo ''
      echo '## 3. Virtuelle Python Umgebung (venv)'
      python3 -m venv /root/.venv
      echo 'source /root/.venv/bin/activate' >> /root/.bashrc
      
      if [ -f requirements.txt ]; then
        echo ''
        echo '## 4. PIP-Installationen'
        /root/.venv/bin/pip install --no-cache-dir -r requirements.txt
      fi

      echo ''
      echo '## 5. DuckDB Skills hinzufügen'
      npx -y skills add https://github.com/duckdb/duckdb-skills --skill duckdb-docs -y -g
      
      echo ''
      echo '## Setup erfolgreich abgeschlossen!'
    } 2>&1 | tee /app/ausgabe.md
    
    echo ''
    echo '✨ Dirac-Umgebung mit Node v22 und venv ist bereit!'
    bash
  "