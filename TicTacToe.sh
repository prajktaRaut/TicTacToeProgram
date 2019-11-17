#!/bin/bash -x

echo " Welcome to Tic-Tac-Toe game "

#Constatnt
MAXPOSITION=9

#Array
declare -a boardstructure


function boardPattern()
{
for (( i=1; i<= MAXPOSITION; i++ ))
do
	boardstructure[$i]=0
done 
}

boardPattern

