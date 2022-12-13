#!/bin/bash
#Gruppen verwalltung
#Gruppenarbeit von Kerem, Kevin, Denys, Arnold
#email vom admin chisar@elektronikschule.de


source "funktionen.sh"







function useradd
kdialog --inputbox username=echo$(" Wer wird Hinzugefügt")

    echo "Wohin soll der User gespeichert werden"
    read -p "Eingabe : WHERE2ADD
    echo "Sind sie Sicher das sie den User hinzufügen wollen"
yesno-dialog who2del
        YESNO=0
        until [ $YESNO = 1 ]
        do
		$1
		read -p "| (0: nein | 1: ja) " YESNO
        done
}


function deletegroup(){

	yesno-dialog where2Find 
	for I in $(find ${WHERE2FIND} -maxdepth 1 \( -name "*tgz" -o -name "*xz" -o -name "*bzip2" \) )
	do 
		echo "|> "$I
	done
   	yesno-dialog what2Del 
	rm ${WHAT2DEL}
	if [ $? = 0 ]
	then
		echo "| ${WHAT2DEL} wurde gelöscht!"
	fi
	sleep 2
}

function userdel(){
	yesno-dialog where2deluser
	for I in $(find ${WHERE2DELUSER} -maxdepth 1 \( -name "*tgz" -o -name "*xz" -o -name "*bzip2" \) )
	do 
		echo "|> "$I
	done
   	yesno-dialog who2Del 
	rm ${WHO2DEL}
	if [ $? = 0 ]
	then
		echo "| ${WHO2DEL} wurde gelöscht!"
	fi
	sleep 2
