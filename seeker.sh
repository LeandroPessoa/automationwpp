#!/bin/bash          
STR=$(tail -1 nohup.out)


if [[ $STR == *"Echoing liga to 553192624941"* ]]; then
  curl http://localhost:5000/liga
fi

if [[ $STR == *"Echoing desliga to 553192624941"* ]]; then
  curl http://localhost:5000/desliga
fi