#!/bin/bash -x

echo " Welcome to Tic-Tac-Toe game "

#Constatnt
MAXPOSITION=9
RANDOM_VALUE=0
COLUMN_SIZE=3
ROW_SIZE=3

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

function printBoard()
{
	n=1
	for (( i=1; i<=$COLUMN_SIZE; i++ ))
	do
        	for (( j=1; j<=$ROW_SIZE; j++ ))
        	do

                	printf '\t'
                	printf '%s' "${boardstructure[$n]}"
        		n=$(( $n + 1 ))
        	done
                	printf '\n'
	done

}

function playerInput
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
		checkWinForHorizontal
		CheckWinForVertical
		checkWinForDiagonal

                if [ $counter -eq 3 ];
                then
                        break
                fi

        done

}

function checkWinForHorizontal()
{
        count=0
        position=1
        while [ $count -lt 3 ]
        do
                if [[ ${boardstructure[$position]} == $playerLetter ]] && [[ ${boardstructure[$position]} == ${boardstructure[$position +1]} ]] && [[ ${boardstructure[$position +1]} == ${boardstructure[$position +2]} ]]
                then
                        echo "Win"
                        break
                fi
                        position=$(( $position + 3 ))
                        count=$(( $count + 1 ))
        done
}

function CheckWinForVertical()
{
	count1=0
        position=1
        while [ $count1 -lt 3 ]
        do
                if [[ ${boardstructure[$position]} == $playerLetter ]] && [[ ${boardstructure[$position]} == ${boardstructure[$position +3]} ]] && [[ ${boardstructure[$position+3]} == ${boardstructure[$position +6]} ]]
                then
                        echo "Win"
                        break
                fi
                        position=$(( $position + 1 ))
                        count1=$(( $count1 + 1 ))
        done

}

function  checkWinForDiagonal()
{

	count2=0
        position=1
        while [ $count2 -lt 2 ]
        do
                if [[ ${boardstructure[$position]} == $playerLetter ]] && [[ ${boardstructure[$position]} == ${boardstructure[$position +4]} ]] && [[ ${boardstructure[$position + 4]} == ${boardstructure[$position + 8]} ]]
                then
                        echo "Win"
                        break

		elif [[ ${boardstructure[$position + 2]} == $playerLetter ]] && [[ ${boardstructure[$position + 2]} == ${boardstructure[$position +4]} ]] && [[ ${boardstructure[$position + 4]} == ${boardstructure[$position +6]} ]] 		
		then
			echo "win"
			break
                fi
                        count2=$(( $count2 + 1 ))
        done


}

boardPattern
printBoard
assignLetter
playerInput
