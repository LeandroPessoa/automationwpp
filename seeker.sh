#!/bin/bash          

echo "Running..."
while :
do
	STR=$(tail -1 nohup.out)
	if [[ $STR == *"Echoing liga to 553192624941"* ]]; then
	  curl http://localhost:5000/liga
	  echo "ligado"
	fi

	if [[ $STR == *"Echoing desliga to 553192624941"* ]]; then
	  curl http://localhost:5000/desliga
	  echo "desligado"
	fi
done