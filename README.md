# Skill condivise

Raccolta di skill per Claude Code, da installare su ogni postazione dell'organizzazione.

## Installazione (ogni postazione)

```bash
git clone <URL-DEL-REPO> ~/org-skills
bash ~/org-skills/install.sh
```

Lo script crea un link per ogni cartella in `skills/` dentro `~/.claude/skills/`, così le skill sono disponibili in tutti i progetti. Per aggiornare:

```bash
cd ~/org-skills && git pull && bash install.sh
```

## Contenuto

Ogni cartella in `skills/` è una skill. Le fonti e le licenze sono in [SOURCES.md](SOURCES.md).

## Note

- `impeccable` ha un motore binario specifico per piattaforma che non è incluso nel repo. Dopo l'installazione esegui `npx impeccable install` sulla postazione, poi `/impeccable init` in Claude Code.
- `img2threejs` è una copia di un repo esterno: per aggiornarla fai riferimento al repo originale.
- Le skill vengono eseguite con i permessi dell'agente. Leggi il codice prima di aggiungere una nuova skill al repo.

## Aggiungere una skill

1. Copia la cartella in `skills/<nome>/`.
2. Aggiungi la fonte e la licenza in `SOURCES.md`.
3. Apri una PR o un commit, poi aggiorna le postazioni con `git pull && bash install.sh`.
