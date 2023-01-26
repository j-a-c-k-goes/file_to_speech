#!/usr/bin/env bash
# Application Details
APP_NAME="FileToSpeech"
VERSION="1.0.0"

# Welcome message
echo "\n---- ${APP_NAME} — ${VERSION} ----\n"

echo "\nApplication Context"
echo "${APP_NAME} will read a specified file."
echo "Read content saves to audio format. The built-in speech synthesis enables this.\n"

echo "\nDefaults:"
echo "By default, files are saved inside of the \"content\" directory."
echo "Also, the application is set to expect files located in the User's home directory."

echo "\nFuture Updates:"
echo "User-defined output destination."
echo "Additional audio formats beyond .aiff (note: mp3 and wav cause errors for some reason)."

# Command line argument to specify a file
# f, file (string): Path of the file.
# n, name (string): Name of output file.
# e, extension (string): Extension to save the output. 

while getopts f:n: flag
do
	case "${flag}" in
		f) file=${OPTARG};;
		n) name=${OPTARG};;
	esac
done

# Display entered arguments as an update.
echo "\nOutput Details:"
echo "The file being spoken: ${file}"
echo "Output to be saved with this name: ${name}.aiff"

# Command to read the file
echo "Reading and creating an audio file from source."
cat ~/$file | say -v alex -o content/${name}.aiff 