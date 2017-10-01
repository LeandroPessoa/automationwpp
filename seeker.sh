#!/bin/bash          
echo "Checando se já não estou em execução..."


# trap ctrl-c and call ctrl_c()
trap ctrl_c INT

function ctrl_c() {
        echo "Flw vlw"
        rm -f /tmp/myscript.running
        exit 1
}

if [[ -f /tmp/myscript.running ]] ; then
    exit
fi
touch /tmp/myscript.running


  echo "Running..."
	while :
	do
		STR=$(tail -1 output.txt)
		if [[ $STR == *"Echoing liga to 553192624941"* ]]; then
		  curl http://localhost:5000/liga || rm -f /tmp/myscript.running
		  printf "ligado\n"
		fi

		if [[ $STR == *"Echoing desliga to 553192624941"* ]]; then
		  curl http://localhost:5000/desliga || rm -f /tmp/myscript.running
		  printf "desligado\n"
		fi

		if [[ $STR == *"Echoing desligapc to 553192624941"* ]]; then
                  curl http://localhost:5000/pcdesliga || rm -f /tmp/myscript.running
                  printf "desligado\n"
                fi

		if [[ $STR == *"Echoing ligapc to 553192624941"* ]]; then
                  curl http://localhost:5000/pcliga || rm -f /tmp/myscript.running
                  printf "desligado\n"
                fi


	done



