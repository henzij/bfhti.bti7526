# Beispiel Erstellung einer einfachen VM und Verwendung bestehender Ressourcen
Bei diesem Beispiel werden nur die minimal notwendigen Ressourcen für eine VM erstellt, dies sind die 3 Ressourcen "Public IP", "Virtuelles Netzwerkinterface" und die VM selbst (weiter unten in Tabelle noch detaillierter aufgelistet). Dies bedingt allerdings, dass folgende Ressourcen vorgängig z.B. manuell über das Azure Portal angelegt werden:
- Virtuelles Netzwerk
- Subnetz
- Ressourcengruppe

<br />
Verwendete Authentifizierungsmethode für ssh Verbindung:
- Benutzername und Passwort

(definiert im Bereich os_profile der Ressource)
<br /><br />
Beim Beispiel werden folgende Ressourcen angelegt:

| Ressourcentyp | Azure-Name des Beispiels |
| ------------- | ------------------------ |
| Public IP | myPublicIP02-test |
| Virtuelles Netzwerkinterface | nic-test |
| Virtuelle Maschine | testDroplet01 |