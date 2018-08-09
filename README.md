# feh-wallpaper-animator
The provided script, 'fehsh.sh', will convert a .gif file into a series of .png images, then continuously loop through the images while updating the wallpaper.  The script will continue to run until the user terminates the script with SIGINT (ctrl+c or cmd+c), the task manager, or exits the X session.  If the .gif file has already been converted to .png images, only the looping is performed.  This script only works on Unix-like systems and window environments where feh is permitted to set the wallpaper.  Therefore, this script is ideal for minimal window manager desktops.

## Dependencies
* ImageMagick  
* feh  

## Preparation
When using this script in other environments, it's recommended to make this script executable:
```
$ chmod +x fehsh.sh
```

* The basic format for calling this script is:
```
$ ./fehsh.sh path-to-gif-directory [Vv][Ss]low | [Ss]low | [Mm]ed | [Ff]ast] | [Vv][Ff]ast
```

## Usage
**There are two main use cases available for the provided script:**  
### 1. Convert a .gif file for use as an animated wallpaper
* Place a .gif file in an empty directory and run
```
$ mkdir example_dir
$ mv example.gif example_dir
$ ./fehsh.sh example_dir slow
```
* After conversion, the .gif file will be moved to the parent folder

### 2. Run on an existing set of converted .png images
```
$ ./fehsh.sh example_dir slow
```

## License
This project is licensed under the [GNU General Public License GPLv3](https://www.gnu.org/licenses/gpl-3.0.en.html).
