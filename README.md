# Info

* ADB Shell script to uninstall all bloated apps that comes with some Android TV's, that cannot be uninstalled using the TV UI with the remote

# How to run

* Clone this repo
* First you need to connect to your Android TV using the command below
```bash
adb connect <your tv local ip here>:5555
```
* Then, you need to list out all your Android TV installed apps via the command below
```bash
adb shell cmd package list packages "|cut -f 2 -d": >> ~/Desktop/packages.txt
```
* Copy all the app names that you want to uninstall, line by line into a `bloat.txt` file in the **SAME** directory with `uninstall-bloat.sh` script
* Make sure you have `enabled USB debugging` in your `Developer` settings.
* Add your local tv ip in the `uninstall-bloat.sh` on the `tv_local_ip` variable
* Run this script using the command below
```bash
sh uninstall-bloat.sh
```
* Follow the script instructions.
* Enjoy
👌
