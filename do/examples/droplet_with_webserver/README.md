# Beispiel für ein einfaches Droplet mit Webserver

Um einen Anderen Namen für das Droplet zu wählen, im main.tf in der Ressource "testDroplet" den "name" anpassen.
Um ein Droplet mit Terraform anzulegen:Vorgehen nach dieser Beschreibung: [Wie mit den Examples umgehen](https://github.com/henzij/bfhti.bti7526/blob/master/do/README.md)

Nebst der normalen Droplet Installation, wird auch ein Nginx installiert. 
Dafür bedarf es ein gültiger SSH-Private Key, damit der Login vom Management System aus auf das Webserver Droplet erfolgen kann.
Der Key muss an folgendem Ort hinterlegt werden: "~/.ssh/ppk"
