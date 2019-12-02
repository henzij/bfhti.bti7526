# Generierung von Key Pair
Hier wird beschrieben, wie in den Betriebssystemen Ubuntu Linux und Windows ein Schlüsselpaar (Key Pair) generiert werden kann. Dieses Schlüsselpaar kann als Authenzifizierungsmethode bei einer ssh Verbindung dienen.

## Windows - Generierung von Key Pair mit Putty
In Windows kann ein Schlüsselpaar (private und public) mit der Anwendung Putty generiert werden.

Putty kann hier heruntergeladen werden:
https://www.putty.org/

Wenn Putty installiert ist, kann für die Generierung der Schlüssel **PuTTYgen** gestartet werden:
![PuTTYgen](../img/00a_puttyGen‎.png)

Mit Hilfe von PuTTYgen kann nun folgendermassen ein Schlüsselpaar generiert werden:
1. Als Typ "RSA" auswählen
2. Auf "Genearte" klicken und die Maus im Feld darüber bewegen. Durch die Bewegung der Maus, wird eine Zufälligkeit generiert.
![PuTTYgenGenerate](../img/00b_puttyGen_‎generate.png)