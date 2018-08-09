#!/bin/sh

# More meaningful argument names
GIF_PATH=$1
SPEED=$2
ERR_MSG="Usage: $ $0 path-to-gif-directory 
	[Vv][Ss]low | [Ss]low | [Mm]ed | [Ff]ast] | [Vv][Ff]ast"

# Take exactly two arguments
if [ $# -ne 2 ]; then
	echo "Incorrect number of arguments.  Two arguments are required."
	echo $ERR_MSG
	exit
# Confirm that first argument is a directory
elif [ ! -d $GIF_PATH ]; then
	echo "Not a directory"
	exit
fi

# Get total image count of first argument and offset
TOTAL_IMG=$((`ls $GIF_PATH | wc -l` - 1))

# If 0, exit
if [ $TOTAL_IMG -eq 0 ]; then
	echo "No gif or images found.  Exiting now"
	exit
# If 1, confirm .gif extension and convert
elif [ $TOTAL_IMG -eq 1 ]; then
	IS_GIF=`find $GIF_PATH -name "*.gif" | wc -l`
	if [ $IS_GIF -eq 1 ]; then 
	# .gif is moved to parent folder after conversion
		GIF_FILE=`ls $GIF_PATH`
 		convert -coalesce $GIF_PATH/$GIF_FILE $GIF_PATH/gif.png
 		mv $GIF_PATH/$GIF_FILE .
	else
		echo "The file provided for conversion is not of .gif format"
		exit
	fi
fi

# 2nd argument sets speed
case $SPEED in
	[Vv][Ss]low | [Vv][Ss])
		echo "Very slow animation speed selected"
		SPEED=0.50
		;;
	[Ss]low | [Ss])
		echo "Slow animation speed selected"
		SPEED=0.35
		;;
	[Mm]ed | [Mm])
		echo "Medium animation speed selected"
		SPEED=0.20
		;;
	[Ff]ast | [Ff])
		echo "Fast animation speed selected"
		SPEED=0.15
		;;
	[Vv][Ff]ast | [Vv][Ff])
		echo "Very fast animation speed selected"
		SPEED=0.05
		;;
	*) # Else, exit
		echo "Invalid input.  Please enter slow, medium, or fast."
		echo $ERR_MSG
		exit
		;;
esac

# If everything above passes, execute the program
echo "Initialization successful.  Press ctrl+c to exit."

# Infinite loop 
COUNTER=0
while : 
do
	# Increment counter and reset
	if [ $COUNTER -lt $TOTAL_IMG ]; then
		feh --bg-fill $GIF_PATH/gif-$COUNTER.png
		COUNTER=$(($COUNTER + 1))
		sleep $SPEED
	elif [ $COUNTER -eq $TOTAL_IMG ]; then
		feh --bg-fill $GIF_PATH/gif-$COUNTER.png
		COUNTER=0
		sleep $SPEED
	fi
done
