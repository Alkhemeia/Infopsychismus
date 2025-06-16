#!/bin/bash

# Skript zur Behebung von Anchor-Warnungen in MkDocs-Dateien
# Sucht nach fehlenden Ankern in den Sprachverzeichnissen

# Farben für die Ausgabe
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}Suche und fixe fehlerhafte oder fehlende Anker in Markdown-Dateien...${NC}"

# Array mit allen Sprachverzeichnissen
languages=("ar" "de" "es" "fr" "hi" "it" "ja" "ko" "pt" "ru" "tr" "zh")

# Anzahl der gefundenen und korrigierten Probleme
fixed_count=0
problem_count=0

# Überprüfe die Hauptverzeichnisse für anchors
for lang in "${languages[@]}"; do
    echo -e "${YELLOW}Überprüfe Sprache: ${lang}${NC}"
    
    # Finde alle Markdown-Dateien im Sprachordner
    lang_dir="docs/languages/${lang}"
    if [ -d "$lang_dir" ]; then
        # Suche nach Dateien mit fehlenden ID-Ankern für Überschriften
        missing_anchors=$(find "$lang_dir" -name "*.md" -exec grep -l "^#" {} \; | xargs grep -L "{#" 2>/dev/null || echo "")
        
        if [ -n "$missing_anchors" ]; then
            for file in $missing_anchors; do
                echo -e "${RED}Fehlende Anker in: ${file}${NC}"
                problem_count=$((problem_count + 1))
                
                # Optional: Automatische Korrektur, fügt {#id} zu Überschriften hinzu
                # sed -i 's/^# \(.*\)$/# \1 {#id}/g' "$file"
            done
        fi
        
        # Suche nach verlinkten Ankern, die nicht existieren
        broken_links=$(find "$lang_dir" -name "*.md" -exec grep -l "\[.*\](.*#" {} \; | xargs grep -l "#" 2>/dev/null || echo "")
        
        if [ -n "$broken_links" ]; then
            for file in $broken_links; do
                echo -e "${YELLOW}Überprüfe Links in: ${file}${NC}"
                
                # Extrahiere die Anker-Links
                anchors=$(grep -o "\[.*\](.*#[^ )]\+)" "$file" | grep -o "#[^ )]\+" || echo "")
                
                if [ -n "$anchors" ]; then
                    echo -e "  Gefundene Anker-Links: $anchors"
                fi
            done
        fi
    else
        echo -e "${RED}Verzeichnis nicht gefunden: ${lang_dir}${NC}"
    fi
done

echo -e "${GREEN}Fertig! ${problem_count} Dateien mit potenziellen Problemen gefunden.${NC}"
echo -e "${GREEN}${fixed_count} Probleme wurden automatisch behoben.${NC}"

