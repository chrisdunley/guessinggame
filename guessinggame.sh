#!/usr/bin/env bash

function more_or_less {
	if [[ $1 -gt $filec ]]
	then	echo '1'
	else	echo '-1'
	fi	}

filec=$(ls -1A | wc -l) # Get number of files in cwd. -1 forces one line per file, -A catches . files

echo '********************************************'
echo 'Welcome to file number guesser!'
echo '********************************************'
echo 'Please enter a positive integer for each guess.'
echo 'We will tell you if you are too high, too low or just right'

first=0
equal=1
guess=-1

while [[ $equal -ne 0 ]]
do
	if [[ $first -eq 1 ]]
	then	if [[ $equal -eq -1 ]]
				then	echo "Oh dear - that's too few.  Try a higher number"
				else	echo "Bit over the top.  Try something smaller"
			fi
	fi
	let first=1
	while [[ $guess -lt 0 ]]
	do
		read -p 'Enter your guess and then return: ' guess
		if [[ ! $guess =~ ^[0-9]+$ ]] # Checks that only digits in input - no decimals or negative numbers
		then	echo "I need a positive whole number please.  Try again!"
				let guess=-1
		fi
	done
	if [[ $guess -eq $filec ]]
	then	let equal=0
	else	let equal=$(more_or_less $guess)
			let guess=-1
	fi
done
echo '********************************************'
echo "Congratulations - you got the number $filec spot on"
echo '********************************************'

