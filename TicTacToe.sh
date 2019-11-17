#!/bin/bash -x

echo " Welcome to Tic-Tac-Toe game "

#Constatnt
MAXPOSITION=9
RANDOM_VALUE=0

#Variable
playerLetter=''
computerLetter=''


#Array
declare -a boardstructure


function boardPattern()
{
for (( i=1; i<= MAXPOSITION; i++ ))
do
	boardstructure[$i]=0
done 
}

function assignLetter()
{
	result=$((RANDOM%2))

	if [ $result -eq $RANDOM_VALUE ];
	then
		playerLetter='X'
		computerLetter='O'
	else
		playerLetter='O'
		computerLetter='X'
	fi

}

boardPattern
assignLetter
