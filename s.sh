#!/bin/bash

## Funktioner for vores menu-punkter
conn_server1() {
	ssh v5@1.2.3.4
}
conn_server2() {
	ssh v5@4.3.2.1
}
conn_server3() {
	ssh v5@12.23.34.45
}
conn_server4() {
	ssh v5@54.43.32.21
}
get_IP() {
	curl ipecho.net/plain ; echo ; read
}
while :
do
		## Vores Menu
    dialog --clear --backtitle "v5.dk Screen 1.0" --title "Menu" \
    --menu "Start en funktion:" 24 60 12 \
    "hanne.v5.dk"	"Forbind til Server 1" \
    "lone.v5.dk"	"Forbind til Server 2" \
    "britney.v5.dk"	"Forbind til Server 3" \
    "pamala.v5.dk"	"Forbind til Server 4" \
    "ip"	"Find din IP-adresse" \
    "Afslut"      "Afslut programmet" 2> ~/.menuchoices

    retopt=$?
    choice=`cat ~/.menuchoices`

    case $retopt in

       0) case $choice in
			 		## Starter en funktion udfra et valg i menuen
          hanne.v5.dk)  conn_server1 ;;
				  lone.v5.dk)  conn_server2 ;;
				  britney.v5.dk)  conn_server3 ;;
				  pamala.v5.dk)  conn_server4 ;;
				  ip)  get_IP ;;
          Afslut)       clear; exit 0;;

      esac ;;

    	*)clear ; exit ;;

	  esac

done
