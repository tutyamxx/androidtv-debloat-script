# Info

* ADB Shell script to uninstall all bloated apps that comes with some Android TV's

# How to run

* Clone this repo
* First, you need to list out all your Android TV installed apps via the command below
```bash
adb shell cmd package list packages "|cut -f 2 -d": >> ~/Desktop/packages.txt
```
* Copy all the apps line by line into a `bloat.txt` file in the **SAME** directory with `uninstall-bloat.sh` script
* Make sure you have `enabled USB debugging` in your `Developer` settings.
* Run this script using the command below
```bash
sh uninstall-bloat.sh
```
* Follow the script instructions.
* Enjoy
👌
