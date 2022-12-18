# welcome message
echo "application name: file to speech 0.0.0"
echo date
application_name="FILE TO SPEECH"
echo "\nhello. you are now using the ${application_name} application. it will read a specified file, and then save its contents to audio format. by default, files are saved inside of the content directory; however, you can change this by providing a location (and its absolue path).\n"

# command line argument to specify a file
while getopts f:n:e: flag
do
	case "${flag}" in
		f) file=${OPTARG};;
		n) name=${OPTARG};;
		e) extension=${OPTARG};;
	esac
done

# voice update
echo "the given arguments are: '${file}' '${name}' '${extension}'"

# command to read the file
echo "reading and then creating a audio file from source."
cat $file | say -v alex -o content/${name}.${extension}