#!/bin/bash
if [ "$EUID" -eq 0 ]
	then echo "Do not run this file as root, it causes unwanted behaviour"
	exit
fi

if ! command -v pyinstaller &> /dev/null
then
	echo "Pyinstaller is not installed, or is not on PATH"
	echo "Try installing it with 'pip install pyinstaller'"
	exit
fi

cd src
echo "---------------------------------------"
echo "Creating building_pyinstaller directory"
echo "---------------------------------------"
rm -rf building_pyinstaller --verbose
mkdir -p building_pyinstaller --verbose

echo "-------------------"
echo "Copying python file"
echo "-------------------"
cp processing-run.py building_pyinstaller/ --verbose
cd building_pyinstaller

echo "-------------------"
echo "Running pyinstaller"
echo "-------------------"
pyinstaller processing-run.py --onefile --clean

echo "------------------------------------------------------------------------"
echo "Finished building executable, moving from building_pyinstaller directory"
echo "------------------------------------------------------------------------"
cd ..
mv building_pyinstaller/dist/processing-run . --verbose
chmod +x processing-run --verbose

echo "---------------------------------------"
echo "Deleting building_pyinstaller directory"
echo "---------------------------------------"
rm -rf building_pyinstaller --verbose

echo "------------------------------------------------"
echo "Do you want to copy program to /usr/local/bin/ ?"

select yn in "Yes" "No"
do
	case $yn in
		Yes ) sudo cp processing-run /usr/local/bin/; echo "processing-run copied to /usr/local/bin/"; break;;
		No ) break;;
	esac
done
