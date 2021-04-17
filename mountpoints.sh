#!/bin/bash

#cat de fstab filtrant els comentaris
sudo cat /etc/fstab | grep '^[^#]' >> mountpoint.txt

#mirar si el directori FitxConfBackup existeix i sino, crearlo
if [[ ! -d FitxConfBackup ]]
then
		sudo mkdir FitxConfBackup
fi

#mirar si el fitxer ja existeix i esborrar l'antic per despres moure el nou
if [[ -e FitxConfBackup/mountpoint.txt ]]
then
	sudo rm FitxConfBackup/mountpoint.txt
fi

#moure el nou mountpoint.txt al directori
sudo mv -i mountpoint.txt FitxConfBackup/
