#!/bin/bash
#
# This script create our initial tarball
#

# Errors are fatal
set -e

# Our root directory for the tarball
DIR="test-src"

# Our test tarball
TARBALL="test-tarball.tgz"

#
# How many directories and how many files in each directory?
#
NUM_FILES_AND_DIRS=5

if test "$1" == "-h" -o "$1" == "--help"
then
	echo "! "
	echo "! Syntax: $0 [ num_files_and_directories ]"
	echo "! "
	echo "! num_files_and_directories - The number of directories and files in each dir (default: ${NUM_FILES_AND_DIRS})"
	echo "! "
	exit 1

elif test "$1"
then
	NUM_FILES_AND_DIRS=$1

fi

# Cleanup if we have an existing directory
rm -rfv ${DIR}

#
# Create a series of directories with files and directories under them.
#
echo "# Creating test directory: ${DIR} (${NUM_FILES_AND_DIRS} directories and ${NUM_FILES_AND_DIRS} files in each directory)"
for I in $(seq ${NUM_FILES_AND_DIRS})
do
	mkdir -p ${DIR}/${I}

	#
	# Make a file in this directory.
	#
	TARGET="${DIR}/file-${I}.txt"
	if test ! -f "${TARGET}"
	then
		echo "Test content" > ${TARGET}
	fi

	#
	# Make our files in each sub-directory
	#
	for J in $(seq ${NUM_FILES_AND_DIRS})
	do
		mkdir -p ${DIR}/${I}/${J}
		
		TARGET="${DIR}/${I}/file-${J}.txt"
		echo "Test content" > ${TARGET}
	done

	#
	# Make a symlink to the previous number.
	# I am aware that this will result in the first symlink being broken, and
	# that is intentional, as I want broken symlinks to created/tested.
	#
	if test "$I" -gt 1
	then
		SOURCE="${DIR}/${I}/file-${I}.link"
		TARGET="../file-$(( I - 1 )).data" 

		ln -sf ${TARGET} ${SOURCE} 
	fi

done

#
# Create our test tarball, move it to our starting directory, and remove our temp directory
#
NUM_FILES=$(find . -type f | wc -l | awk '{print $1}')
TOTAL_SIZE=$(du -hs | awk '{print $1}')

echo "# Done! (Files and dirs in directory ${DIR}...)"

