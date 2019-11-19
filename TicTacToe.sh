#!/bin/bash -x

echo " Welcome to Tic-Tac-Toe game "

#Constatnt
MAX_POSITION=9
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
for (( i=1; i<= MAX_POSITION; i++ ))
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

function CheckWinForHorizontal()
{
        count=0
        position=1
        while [ $count -lt 3 ]
        do
                if [[ ${boardstructure[$position]} == $playerLetter ]] && [[ ${boardstructure[$position]} == ${boardstructure[$position +1]} ]] && [[ ${boardstructure[$position +1]} == ${boardstructure[$position +2]} ]]
                then
                        echo "Win"
                        break
		else
			checkComputerVerticleMove
		
                 fi
                        position=$(( $position + 3 ))
                        count=$(( $count + 1 ))
        done
}

function CheckWinForVertical()
{
	increment=0
        position=1
        while [ $increment -lt 3 ]
        do
                if [[ ${boardstructure[$position]} == $playerLetter ]] && [[ ${boardstructure[$position]} == ${boardstructure[$position +3]} ]] && [[ ${boardstructure[$position+3]} == ${boardstructure[$position +6]} ]]
                then
                        echo "Win"
                        break
		else
			checkComputerVerticleMove
                fi
                        position=$(( $position + 1 ))
                        increment=$(( $increment + 1 ))
        done

}

function  checkWinForDiagonal()
{

	value=1
        position=1
        while [ $value -lt 2 ]
        do
                if [[ ${boardstructure[$position]} == $playerLetter ]] && [[ ${boardstructure[$position]} == ${boardstructure[$position +4]} ]] && [[ ${boardstructure[$position + 4]} == ${boardstructure[$position + 8]} ]]
                then
                        echo "Win"
                        break
		else
			 checkComputerFirstDiagonalMove
		fi

		if [[ ${boardstructure[$position + 2]} == $playerLetter ]] && [[ ${boardstructure[$position + 2]} == ${boardstructure[$position +4]} ]] && [[ ${boardstructure[$position + 4]} == ${boardstructure[$position +6]} ]] 		
		then
			echo "win"
			break
		else
			checkComputerSecondDiagonalMove
                fi

                        value=$(( $value + 1 ))
        done


}

function checkComputerVerticleMove()
{

		if [[ ${boardstructure[$position]} == $playerLetter ]] && [[ ${boardstructure[$position]} == ${boardstructure[$position+6]} ]]
		then
			 echo "position $(($position + 3 )) is blank"

		elif [[ ${boardstructure[$position]} == $playerLetter ]] &&[[ ${boardstructure[$position]} == ${boardstructure[$position+3]} ]];
		then
			echo "position $(($position +6 )) is blank" 

		elif [[ ${boardstructure[$position + 3]} == $playerLetter ]] && [[ ${boardstructure[$position+3]} == ${boardstructure[$position+6]} ]];
		then
			 echo "position $(($position)) is blank"
		fi

}

function checkComputerHorizontalMove()
{
		if [[ ${boardstructure[$position]} == $playerLetter ]] && [[ ${boardstructure[$position]} == ${boardstructure[$position+2]} ]]
                then
                         echo "position $(($position + 1 )) is blank"

                elif [[ ${boardstructure[$position]} == $playerLetter ]] &&[[ ${boardstructure[$position]} == ${boardstructure[$position+1]} ]];
                then
                        echo "position $(($position +2 )) is blank" 

                elif [[ ${boardstructure[$position + 1]} == $playerLetter ]] && [[ ${boardstructure[$position+1]} == ${boardstructure[$position+2]} ]]
                then
                         echo "position $(($position)) is blank"
                fi

}

function checkComputerFirstDiagonalMove()
{
		if [[ ${boardstructure[$position]} == $playerLetter ]] && [[ ${boardstructure[$position]} == ${boardstructure[$position+8]} ]];
                then
                         echo "position $(($position + 4 )) is blank"

                elif [[ ${boardstructure[$position]} == $playerLetter ]] && [[ ${boardstructure[$position]} == ${boardstructure[$position+4]} ]];
                then
                        echo "position $(($position + 8 )) is blank" 

                elif [[ ${boardstructure[$position + 4]} == $playerLetter ]] && [[ ${boardstructure[$position+4]} == ${boardstructure[$position+8]} ]]
                then
                         echo "position $(($position)) is blank"
                fi

}

function checkComputerSecondDiagonalMove()
{
	 if [[ ${boardstructure[$position+2]} == $playerLetter ]] && [[ ${boardstructure[$position+2]} == ${boardstructure[$position+6]} ]];
                then
                         echo "position $(($position + 4 )) is blank"

                elif [[ ${boardstructure[$position+2]} == $playerLetter ]] && [[ ${boardstructure[$position+2]} == ${boardstructure[$position+4]} ]];
                then
                        echo "position $(($position + 6 )) is blank" 

                elif [[ ${boardstructure[$position + 4]} == $playerLetter ]] && [[ ${boardstructure[$position+4]} == ${boardstructure[$position+6]} ]]
                then
                         echo "position $(($position+2)) is blank"
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
		checkWinForHorizontal
		CheckWinForVertical
		checkWinForDiagonal
	done
}
boardPattern
printBoard
assignLetter
playerInput
