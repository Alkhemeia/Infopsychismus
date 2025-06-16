#!/bin/bash

echo "Bereinigung doppelter Dateien..."

# Hindi-Dateien bereinigen
echo "Bereinige Hindi-Dateien..."
# Hinweis: Hindi-Dateien wurden bereits bereinigt, folgende Dateien existieren nur noch in einer Version:
# - 12_आलोचनाएं_और_प्रत्युत्तर.md
# - 16_इन्फोप्साइचिज़्म_और_कृत्रिम_बुद्धिमत्ता_चुनौतियां_और_अवसर.md
# - 17_इन्फोप्साइचिज़्म_और_गणना_व_अनुकरण_की_सीमाएं.md

# Koreanische Dateien bereinigen
echo "Bereinige koreanische Dateien..."
# Behält die vollständigste Version der Datei
rm -f "/home/alkhemeia/Schreibtisch/Infopsychismus/docs/languages/ko/Infopsychismus_Tonghapjeok_Jeojak_KO/05_우리는_왜_의식적_존재로_여기_있는가.md"

# Türkische Dateien bereinigen
echo "Bereinige türkische Dateien..."
# Behält die vollständigste Version der Datei
rm -f "/home/alkhemeia/Schreibtisch/Infopsychismus/docs/languages/tr/Infopsisizm_Butunleyici_Kitap_TR/22_Değişiklik_Kayd.md"

# Russische Dateien bereinigen
echo "Bereinige russische Dateien..."
# Behält die vollständigste Version der Datei
rm -f "/home/alkhemeia/Schreibtisch/Infopsychismus/docs/languages/ru/Infopsikhizm_Integrativnaya_Kniga_RU/14_Углублённые_этические_размышления.md"

echo "Bereinigung doppelter Dateien abgeschlossen."
