all: README.md

README.md: guessinggame.sh
	echo "# **Guessing Game**" >README.md
	echo >>README.md
	echo "**Make** was run on:" >>README.md
	date >>README.md
	echo >>README.md
	echo "The number of lines in the guessinggame.sh file is:" >>README.md
	wc -l guessinggame.sh | egrep -o "[0-9]+" >>README.md

clean:
	rm README.md