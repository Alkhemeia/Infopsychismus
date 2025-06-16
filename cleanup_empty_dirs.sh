#!/bin/bash

# Diese Datei entfernt alle leeren Verzeichnisse im Projekt (außer versteckte Verzeichnisse)
# Es werden keine Dateien gelöscht, nur leere Verzeichnisse

echo "Starte die Bereinigung leerer Verzeichnisse..."

# Anzahl der gefundenen leeren Verzeichnisse vor der Bereinigung
INITIAL_COUNT=$(find ./docs -type d -empty | grep -v "^\./\." | wc -l)
echo "Gefundene leere Verzeichnisse: $INITIAL_COUNT"

if [ $INITIAL_COUNT -eq 0 ]; then
    echo "Es wurden keine leeren Verzeichnisse gefunden. Nichts zu tun."
    exit 0
fi

echo "Die folgenden Verzeichnisse werden entfernt:"
find ./docs -type d -empty | grep -v "^\./\." | sort

# Sicherheitsabfrage
read -p "Möchten Sie fortfahren? (j/n): " CONFIRM
if [ "$CONFIRM" != "j" ]; then
    echo "Abbruch durch Benutzer."
    exit 1
fi

# Entferne alle leeren Verzeichnisse im docs-Verzeichnis
find ./docs -type d -empty -delete

# Überprüfe, ob noch leere Verzeichnisse vorhanden sind
REMAINING=$(find ./docs -type d -empty | grep -v "^\./\." | wc -l)
echo "Bereinigung abgeschlossen. Verbleibende leere Verzeichnisse: $REMAINING"
echo "Es wurden $(($INITIAL_COUNT - $REMAINING)) Verzeichnisse entfernt."

echo "Bereinigung erfolgreich abgeschlossen."
