#/bin/sh
# Dependencies: feh, imagemagick (optional)
#
# Program Description: Create an animated wallpaper, with barely any
# CPU or RAM needed!  On any Unix/Linux platform, turn a gif into an 
# animated wallpaper by performing the following steps:
#


# 1. It is preferred to use a gif image that is your screen's 
# resolution.  Run the following command on any gif image:
#
#	$ cd /path/to/gif && convert pic.gif -coalesce pic.png
#
# 2. Make sure this sh file is executable.  Assuming you keep this
# program in your gif folder (hidden by default), run:
#
#	$ cd /path/to/gif && chmod +x animate-wallpaper.sh
#
# 3. Run this program at startup by adding it to ~/.config/autostart/
# 	~/.config/openbox/autostart, or /etc/xdg/autostart/
# 4. Set the SPEED variable to desired value, or just use the default 
# 5. Done!  Enjoy your new animated wallpaper.


if [ -L $0 ] ; then
    PAT=$(dirname $(readlink -f $0)) ;
else
    PAT=$(dirname $0) ;
fi ;

CNT=0
SPD=.35
TOT=`cd $PAT && ls | wc -l`

while :
do
	if [ $CNT != `echo $((TOT-1))` ]; then
		feh --bg-fill $PAT/pic-$CNT.png
		CNT=$((CNT+1))
		sleep $SPD
	else
		feh --bg-fill $PAT/pic-$CNT.png
		CNT=0
		sleep $SPD
	fi
done
