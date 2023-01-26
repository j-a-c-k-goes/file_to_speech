#!/usr/bin/env bash
# Author: Neo Information Technology & Design
# Interface: Communication, Personal Utility
# Date Last Modified: 26 Januaray 2023
#--------------------------------------------
# Application Details
APP_NAME="FileToSpeech"
VERSION="1.0.0"
AUTHOR="Neo Information Technology & Design"
#--------------------------------------------
# Welcome message
echo "\n---- $APP_NAME ($VERSION) by $AUTHOR ----\n"

echo "\nApplication Context"
echo "${APP_NAME} will read a specified file."
echo "Read content saves to audio format. The built-in speech synthesis enables this.\n"

echo "\nDefaults:"
echo "By default, files are saved inside of the \"content\" directory."
echo "Also, the application is set to expect files located in the User's home directory."
echo "The voice-over rate is set to 120 beats per minute"

echo "\nFuture Updates:"
echo "User-defined output destination."
echo "Additional audio formats beyond .aiff (note: mp3 and wav cause errors for some reason)."
#--------------------------------------------
# Command line argument to specify a file
# f, file (string): Path of the file.
# n, name (string): Name of output file.
while getopts f:n: flag
do
	case "${flag}" in
		f) file=${OPTARG};;
		n) name=${OPTARG};;
	esac
done
#--------------------------------------------
# Display entered arguments as an update.
echo "\nOutput Details:"
echo "The file being spoken: ${file}"
echo "Output to be saved with this name: ${name}.aiff"
#--------------------------------------------
# Read the file and save audio to destination.
echo "Reading and creating an audio file from source."
cat ~/$file | say --voice alex --rate 120 --output-file content/${name}.aiff 