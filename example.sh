#!/bin/bash

## Vores v5.dk Cloud-server
v5cloudserver() {
	ssh danielbahl@93.43.123.4
}
get_IP() {
	curl ipecho.net/plain ; echo ; read
}
while :
do
		## Vores Menu
    dialog --clear --backtitle "Daniels Servermenu baseret på et awesome v5.dk script" --title "Serverlist" \
    --menu "Vælg en server:" 14 60 32 \
    "srv4.cloudnet.dk"	"Min awesome v5.dk Cloud-server" \
    "findip"	"Find din IP-adresse" \
    "Afslut"      "Afslut programmet" 2> ~/.menuchoices

    retopt=$?
    choice=`cat ~/.menuchoices`

    case $retopt in

       0) case $choice in
			 		## Starter en funktion udfra et valg i menuen
          srv4.cloudnet.dk)  v5cloudserver ;;
				  findip)  get_IP ;;
          Afslut)       clear; exit 0;;
      	  esac ;;

    	*)clear ; exit ;;

	  esac

done
