# Vorarbeit: Ablage von public key auf Rechner

Bevor die Terraform Konfiguration ausgeführt werden kann, muss der öffentliche Schlüssel für die Authentifizierung vorgängig auf dem Rechner, auf welchem die Terraform Konfiguration ausgeführt wird, abgelegt werden. Der public key wurde im Beispiel vorgängig unter folgendem Pfad abgelegt (in main.tf bei key_data definiert):

```bash
/home/emanuel/.ssh/rsa_pub_key.pub
```
