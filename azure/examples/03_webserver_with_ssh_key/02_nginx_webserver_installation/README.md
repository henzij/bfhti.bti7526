# Vorarbeit: Ablage von privatem Schlüssel auf VM
Damit der Webserver nginx installiert werden kann, muss zuerst eine Verbindung zur VM aufgebaut werden. Die Authentifizierung hierbei erfolgt über einen privaten Schlüssel. Der private Key wurde im Beispiel vorgänig unter folgendem Pfad auf der VM abgelegt (in main.tf unter private_key definiert):  
/home/emanuel/.ssh/id_rsa