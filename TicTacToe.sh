#!/bin/bash -x

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

function  winPlayer
{
        i=1
        if [[ ${boardstructure[$i]} == $playerLetter ]] && [[ ${boardstructure[$(($i+1))]} == $playerLetter ]] && [[ ${boardstructure[$(($i+2))]} == $playerLetter ]]
        then
                echo  win


        elif [[ ${boardstructure[$i+3]} == $playerLetter ]] && [[ ${boardstructure[$i+4]} == $playerLetter ]] && [[ ${boardstructure[$i+5]} == $playerLetter ]]
        then
                echo win

        elif [[ ${boardstructure[$i+6]} == $playerLetter ]] && [[ ${boardstructure[$i+7]} == $playerLetter ]] && [[ ${boardstructure[$i+8]} == $playerLetter ]]
        then
                echo win


        elif [[ ${boardstructure[$i]} == $playerLetter ]] && [[ ${boardstructure[$i+3]} == $playerLetter ]] && [[ ${boardstructure[$i+6]} == $playerLetter ]]
        then
                echo win


        elif [[ ${boardstructure[$i+1]} == $playerLetter ]] && [[ ${boardstructure[$i+4]} == $playerLetter ]] && [[ ${boardstructure[$i+7]} == $playerLetter ]]
        then
                echo win


        elif [[ ${boardstructure[$i+2]} == $playerLetter ]] && [[ ${boardstructure[$i+5]} == $playerLetter ]] && [[ ${boardstructure[$i+8]} == $playerLetter ]]
        then
                echo win


        elif [[ ${boardstructure[$i]} == $playerLetter ]] && [[ ${boardstructure[$i+4]} == $playerLetter ]] && [[ ${boardstructure[$i+8]} == $playerLetter ]]
        then
                echo win


        elif [[ ${boardstructure[$i+2]} == $playerLetter ]] && [[ ${boardstructure[$i+4]} == $playerLetter ]] && [[ ${boardstructure[$i+6]} == $playerLetter ]]
        then
                echo win
        fi
}



function playerInput()
{
        counter=0
        while [ true ]
        do
        read -p "Enter position number to put $playerLetter at empty position" playerPosition

        if [ ${boardstructure[$playerPosition]} == 0 ];
        then
                counter=$(( $counter + 1 ))
                boardstructure[$playerPosition]=$playerLetter

        else
                echo "Position is occupied, please enter another number"
                playerInput
        fi
                printBoard
                winPlayer

                if [ $counter -eq 3 ];
                then
                        break
                fi

        done

}

boardPattern
printBoard
assignLetter
playerInput
