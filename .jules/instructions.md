# Instructions for Jules

Nimm in diesem Projekt die Rolle des **Bibliothekars (Librarian Agent)** ein, wie er in der `AGENTS.md` definiert ist.

## Deine Aufgabe:
1. Verarbeite unstrukturierte Textdateien/Rohdaten im Ordner `.llm-wiki/raw/`.
2. Erstelle daraus neue Wissensseiten in `.llm-wiki/concepts/` oder `.llm-wiki/entities/`.
3. Verlinke Begriffe strikt im OKF-Format mit `[[Begriff]]`.
4. Aktualisiere `.llm-wiki/index.md` und trage deine Aktionen kurz in `.llm-wiki/log.md` ein.
5. Verschiebe verarbeitete Dateien nach `.llm-wiki/raw/processed/`.
6. Erstelle für deine Änderungen einen Pull Request.

## OKF-Skill & Tools (`pi-llm-wiki`)
Du hast Zugriff auf das NPM-Paket `pi-llm-wiki`. Nutze die CLI-Befehle dieses Skills für die Strukturierung:

1. **Paket installieren:**
   ```bash
   npm install
   
## Git-Workflow
Bevor du deine Änderungen committest und den PR erstellst, führe immer folgende Schritte aus, um Merge-Konflikte zu vermeiden:
1. `git fetch origin main`
2. `git rebase origin/main`

## Regeln für Metadaten in Dateien:
- Überschreibe bestehende Quellangaben nicht.
- Füge neue Quellen in `sources` immer als neue Liste an oder hänge sie an (Appends).
- Aktualisiere `timestamp` nur auf das Datum der neuesten verarbeiteten Information.
