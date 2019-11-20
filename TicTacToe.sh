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
play=false
won=false


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

function checkWinForHorizontal()
{
        count=0
        position=1
        while [ $count -lt 3 ]
        do
                if [[ ${boardstructure[$position]} == $1 ]] && [[ ${boardstructure[$position]} == ${boardstructure[$position +1]} ]] && [[ ${boardstructure[$position +1]} == ${boardstructure[$position +2]} ]]
                then
                        echo "Win" $1
			won=true
                        break
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
                if [[ ${boardstructure[$position]} == $1 ]] && [[ ${boardstructure[$position]} == ${boardstructure[$position +3]} ]] && [[ ${boardstructure[$position+3]} == ${boardstructure[$position +6]} ]]
                then
                        echo "Win" $1
			won=true
                        break
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
                if [[ ${boardstructure[$position]} == $1 ]] && [[ ${boardstructure[$position]} == ${boardstructure[$position +4]} ]] && [[ ${boardstructure[$position + 4]} == ${boardstructure[$position + 8]} ]]
                then
                        echo "Win" $1
			won=true
                        break
		fi

		if [[ ${boardstructure[$position + 2]} == $1 ]] && [[ ${boardstructure[$position + 2]} == ${boardstructure[$position +4]} ]] && [[ ${boardstructure[$position + 4]} == ${boardstructure[$position +6]} ]] 		
		then
			echo "win" $1
			won=true
			break
                fi

                        value=$(( $value + 1 ))
        done


}

function checkComputerVerticleMove()
{
	increment=0
        position=1

        while [ $increment -lt 3 ]
        do
          
		if [[ ${boardstructure[$position]} == $1 ]] && [[ ${boardstructure[$position]} == ${boardstructure[$position+6]} ]]
		then
			value=$(($position + 3 ))
			echo $value 
			break

		elif [[ ${boardstructure[$position]} == $1 ]] &&[[ ${boardstructure[$position]} == ${boardstructure[$position+3]} ]];
		then
			value=$(($position +6 )) 
			echo $value
			break

		elif [[ ${boardstructure[$position + 3]} == $1 ]] && [[ ${boardstructure[$position+3]} == ${boardstructure[$position+6]} ]];
		then
			 value=$(($position))
			 echo $value
			 break

		fi
		  	position=$(( $position + 1 ))
                        increment=$(( $increment + 1 ))
        done



}

function checkComputerHorizontalMove()
{
	count=0
 	position=1
        while [ $count -lt 3 ]
        do

		
		if [[ ${boardstructure[$position]} == $1 ]] && [[ ${boardstructure[$position]} == ${boardstructure[$position+2]} ]]
                then
                        echo $(($position + 1 ))
			break

                elif [[ ${boardstructure[$position]} == $1 ]] &&[[ ${boardstructure[$position]} == ${boardstructure[$position+1]} ]];
                then
                        echo $(($position +2 )) 
			 break
 

                elif [[ ${boardstructure[$position + 1]} == $1 ]] && [[ ${boardstructure[$position+1]} == ${boardstructure[$position+2]} ]]
                then
                         echo $(($position))
			 break
 
                fi

			position=$(( $position + 3 ))
                        count=$(( $count + 1 ))

	done		

}

function checkComputerFirstDiagonalMove()
{
	value1=1
        position=1
        while [ $value1 -lt 2 ]
        do

		if [[ ${boardstructure[$position]} == $1 ]] && [[ ${boardstructure[$position]} == ${boardstructure[$position+8]} ]];
                then
                        echo $(($position + 4 ))
			break 

                elif [[ ${boardstructure[$position]} == $1 ]] && [[ ${boardstructure[$position]} == ${boardstructure[$position+4]} ]];
                then
                        echo $(($position + 8 ))
			break 

                elif [[ ${boardstructure[$position + 4]} == $1 ]] && [[ ${boardstructure[$position+4]} == ${boardstructure[$position+8]} ]];
                then
                        echo $(($position))
			break
                fi
			value1=$(( $value1 + 1 ))

	done
}

function checkComputerSecondDiagonalMove()
{

	value2=1
        position=1
        while [ $value2 -lt 2 ]
        do

	 if [[ ${boardstructure[$position+2]} == $1 ]] && [[ ${boardstructure[$position+2]} == ${boardstructure[$position+6]} ]];
                then
                        echo $(($position + 4 ))
			break

                elif [[ ${boardstructure[$position+2]} == $1 ]] && [[ ${boardstructure[$position+2]} == ${boardstructure[$position+4]} ]];
                then
                        echo $(($position + 6 ))
			break

                elif [[ ${boardstructure[$position + 4]} == $1 ]] && [[ ${boardstructure[$position+4]} == ${boardstructure[$position+6]} ]]
                then
                        echo $(($position+2))
			break
                fi
			 value2=$(( $value2 + 1 ))
	done

}

function playerInput()
{

        read -p "Enter position number to put $playerLetter at empty position" playerPosition

        if [[ ${boardstructure[$playerPosition]} == 0 ]];
        then
                boardstructure[$playerPosition]=$playerLetter
	
        else
                echo "Position is occupied, please enter another number"
                playerInput
        fi
		#printBoard
              	play=false

}


function computerInput()
{
	
	echo "computer playing"

	columnValue=$(checkComputerVerticleMove $playerLetter)

	rowValue=$(checkComputerHorizontalMove $playerLetter)

	firstDiagonalValue=$(checkComputerFirstDiagonalMove $playerLetter)

	secondDiagonalValue=$(checkComputerSecondDiagonalMove $playerLetter)
       
	computerPosition=$((RANDOM%9 +1))


	if [[ ${boardstructure[$rowValue]} == 0 ]];
	then
		 boardstructure[$rowValue]=$computerLetter

	elif [[ ${boardstructure[$columnValue]} == 0 ]];
        then
                 boardstructure[$columnValue]=$computerLetter

	elif [[ ${boardstructure[$firstDiagonalValue]} == 0 ]];
        then
                 boardstructure[$firstDiagonalValue]=$computerLetter

	elif [[ ${boardstructure[$secondDiagonalValue]} == 0 ]];
        then
                 boardstructure[$secondDiagonalValue]=$computerLetter

	else

		if [[ ${boardstructure[$computerPosition]} == 0 ]];
        	then
                	boardstructure[$computerPosition]=$computerLetter
		else
			#echo "position is occupied, please enter another number"
			computerInput
		fi

	fi
		#printBoard
		play=true
}

function checkTie()
{
	count=1
	while [[ ${boardstructure[$count]} != 0 ]];
	do
		if [ $count -eq $MAX_POSITION ];
		then
				echo "Tie"
				won=true
				break
		fi

			count=$(($count +1 ))
	done
}





function whoPlayFirst()
{
	tossResult=$((RANDOM%2))

	if [ $tossResult -eq $RANDOM_VALUE ];
	then
		echo "player play first"
		playerInput
		printBoard


	else
		echo "computer play first"
		computerInput
		printBoard
	fi
}


boardPattern
printBoard
assignLetter
whoPlayFirst

function checkWin()
{

		symbol=$1
  		checkWinForHorizontal $symbol
                CheckWinForVertical $symbol
                checkWinForDiagonal $symbol


}

while [[ $won == false ]]
do
	if [[ $play == true ]];
	then

		playerInput
		printBoard 
		checkWin $playerLetter
		checkTie


	else
		computerInput
		printBoard 
		checkWin $computerLetter
		checkTie

	fi
done


