#!/bin/bash
#
# use cmgen on the path to create environments

if ! command -v cmgen > /dev/null; then
	echo no cmgen found please add it to your path
	exit -1
fi

for f in $(ls *png); do
	FOLDER=$(basename $f .png)
	echo Entering $FOLDER

	if [ -e ../src/main/assets/envs/$FOLDER ]; then 
		echo skipping
		echo
		continue
	fi
	
	cmgen --deploy=../src/main/assets/envs/$FOLDER --format=ktx --size=256 --extract-blur=0.1 $f
	echo
done
