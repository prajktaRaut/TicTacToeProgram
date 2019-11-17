x#!/bin/bash -x

echo " Welcome to Tic-Tac-Toe game "

#Constatnt
MAXPOSITION=9
RANDOM_VALUE=0

#Variable
playerLetter=''

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
	else
		playerLetter='O'
	fi

}

function printBoard()
{
	echo "-----|-----|----- "
	echo "  ${boardstructure[1]}  |  ${boardstructure[2]}  |  ${boardstructure[3]}  "
	echo "----------------- "
	echo "  ${boardstructure[4]}  |  ${boardstructure[5]}  |  ${boardstructure[6]}  "
	echo "----------------- "
	echo "  ${boardstructure[7]}  |  ${boardstructure[8]}  |  ${boardstructure[9]}  "


}

function playerInput()
{
	read -p "Enter position number to put $playerLetter at empty position" playerPosition

	if [ ${boardstructure[$playerPosition]} == 0 ];
	then
		counter=$(( $counter + 1 ))
		boardstructure[$playerPosition]=$playerLetter

	else
		echo "Position is occupied, please enter another number"
		playerInput
	fi

}

boardPattern
printBoard
assignLetter
playerInput
printBoard






