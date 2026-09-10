# AGENTS.md

Diese Datei dokumentiert den primären Agenten und die Projektstruktur innerhalb dieses Systems. Sie dient als zentrale Orientierung ("Landkarte").

## 📂 Projekt-Informationen & Struktur

| Komponente | Beschreibung | Pfad |
| :--- | :--- | :--- |
| **Projektname** | Boerse | `/app` |
| **Wissensbasis (Wiki)** | OKF-basiertes Wissensmanagement | `./.llm-wiki` |
| **Agenten-Konfiguration** | Definition der Rollen & Workflows | `AGENTS.md` |

### 🗺️ Dateisystem-Übersicht

- **Kern-Logik & Skripte:** (Noch nicht spezifiziert - bitte ergänzen)
- **Konfigurationen:**
  - `globalState.json`: Globaler Status des Projekts.
  - `models.json`: Definition der verwendeten Modelle.
- **Dokumentation:**
  - `ausgabe.md`: Dokumentation der Ausgaben/Ergebnisse.
  - `AGENTS.md`: Diese Datei (Agenten-Definitionen).
- **Infrastruktur:**
  - `container.sh`: Skript zum Starten der Umgebung.
  - `pisetup.sh`: Setup-Skript für die Pi-Umgebung.

---

## 🤖 Übersicht der Agenten

| Agent Name | Rolle / Spezialisierung | Kernfähigkeiten | Status |
| :--- | :--- | :--- | :--- |
| **Bibliothekar** | Wissensmanagement & Strukturierung | Datei-Analyse, Wissens-Extraktion, Dokumentation | Aktiv |

---

## 🛠 Agenten-Definitionen

### 1. Bibliothekar (Librarian Agent)
Der Bibliothekar fungiert als das zentrale Gedächtnis des Projekts. Seine Hauptaufgabe ist es, unstrukturierte Informationen und Dateien in strukturierte "Wissenstöpfe" zu überführen, um die langfristige Nutzbarkeit für LLMs zu gewährleisten.

- **Hauptaufgabe:** Identifikation von relevanten Informationen in Dateien und deren Transformation in ein persistentes Wissensformat.
- **Kern-Skill:** **`llm-wiki-okf`**
  - Der Bibliothekar nutzt diesen Skill aktiv, um extrahiertes Wissen in das OKF-Format (Open Knowledge Format) zu überführen.
  - Er verwendet den Skill, um neue Fakten zu speichern, bestehende Wissensseiten zu aktualisieren oder Inkonsistenzen im Projekt-Wiki zu erkennen.
- **Workflow:**
  1. **Scannen:** Analyse von neuen oder geänderten Dateien im Repository.
  2. **Extraktion:** Identifikation von Design-Entscheidungen, Architekturen, Domänen-Entitäten oder wichtigen Logiken.
  3. **Transformation:** Aufbereitung der Daten für das Wiki.
  4. **Persistierung:** Anwendung von `llm-wiki-okf`, um das Wissen dauerhaft und durchsuchbar zu machen.
  5. **Fehlertoleranz beim Editieren:** Bei technischen Problemen beim gezielten Editieren (z. B. Textmatch-Fehler) liest der Agent die Datei vollständig, erstellt die neue Version im Speicher und überschreibt die Originaldatei mittels `write`, um die Integrität zu gewährleisten.

---

## 🔄 Wissens-Workflow (Knowledge Lifecycle)

1. **Input:** Eine Datei wird erstellt oder geändert (z. B. `src/logic.py` oder `docs/arch.md`).
2. **Analyse:** Der Bibliothekar prüft, ob diese Datei "wissenswert" ist.
3. **Aktion:** Wenn ja, wird der Inhalt abstrahiert und via `llm-wiki-okf` in das Wissens-Repository eingepflegt.
4. **Verifikation:** Es wird sichergestellt, dass das neue Wissen keine Widersprüche zu bereits existierenden Wiki-Einträgen erzeugt.

---

## 📜 Richtlinien für das Wissensmanagement

- **Atomarität:** Ein Wissenseintrag sollte sich auf ein spezifisches Konzept oder eine Entscheidung beziehen.
- **Aktualität:** Sobald sich die Quelldatei ändert, muss der entsprechende Wissenstopf via `llm-wiki-okf` aktualisiert werden.
- **Verständlichkeit:** Informationen müssen so aufbereitet sein, dass andere Agenten (und Menschen) sie effizient als Kontext nutzen können.

---
*Letzte Aktualisierung: 2024-05-22 (Erweitert um Projektstruktur & Edit-Fehlertoleranz)*