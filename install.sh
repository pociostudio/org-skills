#!/usr/bin/env bash
# Collega tutte le skill di questo repo in ~/.claude/skills/ (disponibili in ogni progetto).
# Ri-eseguibile: le skill già collegate vengono aggiornate, le cartelle reali esistenti non vengono toccate.
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET="${HOME}/.claude/skills"

mkdir -p "$TARGET"

for src in "$REPO_DIR"/skills/*/; do
  name="$(basename "$src")"
  dest="$TARGET/$name"

  if [ -L "$dest" ]; then
    ln -sfn "$src" "$dest"
    echo "aggiornata  $name"
  elif [ -e "$dest" ]; then
    echo "SALTATA     $name (esiste già una cartella non collegata in $dest: rimuovila o rinominala e rilancia)"
  else
    ln -s "$src" "$dest"
    echo "installata  $name"
  fi
done

echo "Fatto. Le skill sono in $TARGET. Riavvia Claude Code se non compaiono subito."
