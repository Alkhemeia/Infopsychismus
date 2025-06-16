# Entwicklungsanleitung für Infopsychismus

## Lokale Entwicklung

Um das Projekt lokal zu entwickeln, benötigen Sie Python 3.8+ und folgende Schritte:

```bash
# Erstellen und aktivieren einer virtuellen Umgebung
python3 -m venv .venv
source .venv/bin/activate

# Installieren der Abhängigkeiten
pip install mkdocs mkdocs-material mkdocs-minify-plugin

# Lokalen Entwicklungsserver starten
mkdocs serve
```

## GitHub Pages Deployment

Das Projekt verwendet GitHub Actions, um automatisch bei jedem Push auf den `main`-Branch zu deployen.
Der Workflow ist in `.github/workflows/mkdocs-deploy.yml` definiert.

Um Änderungen zu deployen:

```bash
git add .
git commit -m "Ihre commit-Nachricht"
git push origin main
```

Nach dem Push baut GitHub Actions automatisch die Seite und veröffentlicht sie auf GitHub Pages.

## Projektstruktur

- `docs/`: Enthält alle Markdown-Dateien
- `docs/Infopsychismus_Book/`: Enthält die Kapitel des Hauptbuches
- `docs/languages/`: Enthält Übersetzungen in verschiedenen Sprachen
- `mkdocs.yml`: Hauptkonfigurationsdatei für MkDocs
- `.github/workflows/`: Enthält GitHub Actions Workflow-Definitionen
