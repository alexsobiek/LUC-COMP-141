#!/bin/bash 

# 

# A script to prebuild a Java class file 

#  

# Assume that this script accepts an argument, e.g. 

#   new_class ClassName 

# and this argument becomes the name of the class 

  

# First, let's make sure that the file name is not empty. If it is,  

# display a diagnostic message and end the script. 

if [ -z "$1" ]; then 

  echo "File name is empty! Script ends now." 

  exit 1 
fi

if [[ $1 =~ @ ]]; then 

    echo "Character '@' is not allowed in the class name"
    
    exit 2

fi

if [[ ! $1 =~ ^[A-Za-z] ]]; then 

  echo "$1 is not a valid Java class name" 

  exit 2 

fi 

  

# Now that we know the file name is not empty, assign to variable. 

filename="$1.java" # The destination of the script's output 

  

# Check if file already exists 

if [ -f "$filename" ]; then 

  echo "File $filename already exists. Overwrite it? (y/n)" 

  read overwrite 

  if [ "$overwrite" == "n" ]; then 

    echo "OK, I will not overwrite the file. Script ends now." 

    exit 2 

  fi 

fi 

  

  

# Create a variable for the class name. This is the same as $1, so it is # not really necessary, but it makes the code more readable. 

  

classname="$1" # Arguments passed are mapped to $1, $2, ... 

  

cat << _EOF_ > $filename  

/**  

* Class $classname 

*/ 

public class $classname {  

  public static void main(String[] args) {  

  } // method main 

} 

_EOF_

echo "File $filename successfully created." 
