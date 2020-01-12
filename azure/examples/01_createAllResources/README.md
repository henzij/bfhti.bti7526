# Beispiel Erstellung einer einfachen VM und zugehöriger Ressourcen
Dieses Beispiel kann als Vorlage für die Erstellung einer VM Ressource inklusive zugehöriger Ressourcen verwendet werden. Die zu einer Virtuellen Maschine zugehörigen Ressourcen (Ressourcentypen) können der Tabelle weiter unten entnommen werden. Bei diesem Beispiel wurde einzig die Ressourcen Gruppe (hier "BFH_Cloud") vorgänig manuell über das Azure Portal angelegt und wird im data Bereich definiert. Alle anderen Ressourcentypen, welche für das Betreiben einer Azure VM notwendig sind, können mit dem Beispiel erstellt werden.
<br /><br />
Verwendete Authentifizierungsmethode für ssh Verbindung:
- Benutzername und Passwort
(definiert im Bereich os_profile der Ressource)
<br /><br />
Beim Beispiel werden folgende Ressourcen angelegt:

| Ressourcentyp | Azure-Name des Beispiels |
| ------------- | ------------------------ |
| Virtuelles Netzwerk | testnetwork |
| Subnetz | testsubnet |
| Public IP | myPublicIP-test |
| Virtuelles Netzwerkinterface | nic-test |
| Virtuelle Maschine | testDroplet01 |