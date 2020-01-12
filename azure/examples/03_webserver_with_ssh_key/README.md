# Beispiel Erstellung einer VM (Authentifizierung mit key) und Installation von Webserver nginx
Dieses Beispiel kann als Vorlage für die Erstellung einer VM Ressource inklusive zugehöriger Ressourcen verwendet werden. Die zu einer Virtuellen Maschine zugehörigen Ressourcen (Ressourcentypen) können der Tabelle weiter unten entnommen werden. Bei diesem Beispiel wurde einzig die Ressourcen Gruppe (hier "BFH_Cloud") vorgänig manuell über das Azure Portal angelegt und wird im data Bereich definiert. Alle anderen Ressourcentypen, welche für das Betreiben einer Azure VM notwendig sind, können mit dem Beispiel erstellt werden.
<br /><br />
**WICHTIG:**
<br />
Die Erstellung der VM (inklusive zugehöriger Ressourcen, wie z.B. Netzwerk interface) und die Installation des Webservers nginx wurden bewusst von einander getrennt.  Dies aus dem einfachen Grund, weil die dynamische IP-Adresse der VM erst nach dem Booten zugewiesen wird.
<br />
Deshalb zuerst das main.tf im Unterordner "01_vm_with_ssh_key" ausführen lassen und erst danach das im Unterordner "02_nginx_webserver_installation".
<br /><br />
Verwendete Authentifizierungsmethode für ssh Verbindung:
- ssh key pair
(definiert im Bereich os_profile_linux_config der Ressource)
<br /><br />
Beim Beispiel werden folgende Ressourcen angelegt:

| Ressourcentyp | Azure-Name des Beispiels |
| ------------- | ------------------------ |
| Virtuelles Netzwerk | testnetwork2 |
| Subnetz | testsubnet2 |
| Public IP | myPublicIP-test2 |
| Virtuelles Netzwerkinterface | nic-test2 |
| Virtuelle Maschine | testDroplet02 |