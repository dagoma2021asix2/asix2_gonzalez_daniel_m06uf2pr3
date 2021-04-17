#!/bin/bash

#mirar si el fitxer mails.tmp existeix, si no existeix descarregarlo
if [[ ! -e mails.tmp ]]
then
	 sudo wget http://www.collados.org/asix2/m06/uf2/mails.tmp
fi

#expressió regular per poder mirar que el format sigui correcte amb un @
expmail="^[A-Z0-9a-z._%+-]+@[A-Z0-9a-z.-]+\.[A-Za-z]{2,63}$"
mails=`sudo cat mails.tmp`

#recorrer cada mail mirant si el format de la expressio regular es cumpleix
for LINEA in $mails
do
if [[ $LINEA =~ $expmail ]] ; then

    echo "$LINEA" >> mails_ok.txt
fi
done
exit 0
