#!/bin/sh

# Defaults
WORKING_DIR=/
VERSIONS=5

if [ -n "$1" ]
# Test whether command-line argument is present (non-empty).
then
  working_dir=$1
else  
  working_dir=$WORKING_DIR # Default, if not specified on command-line.
fi  

#filename
if [ -n "$2" ]
# Test whether command-line argument is present (non-empty).
then
  filename=$2
else  
  filename="" # Default, if not specified on command-line.
fi  

#versions
if [ -n "$3" ]
# Test whether command-line argument is present (non-empty).
then
  num_versions=$3
else  
  num_versions=$VERSIONS # Default, if not specified on command-line.
fi  

cd $working_dir

echo Checking for.....$filename

# Get list of newest files. If newest files are first, use head -n 14 
# instead of head.
files=(`ls $filename* | sort -r | head -n $num_versions`)

# Loop over all files in this folder
for i in $filename*; do 
 preserve=0; 
 #Check whether this file is in files array:
 for a in ${files[@]}; do 
  if [ $i == $a ]; then 
   preserve=1; 
  fi; 
 done; 
 # If it wasn't, delete it (or in this case, print filename)
 if [ $preserve == 0 ]; then 
   echo "Deleting....."$i  
# test first, then change this to "rm $i"
   rm -f $i
 fi;
done

