#!/bin/bash

# if error acused during program running -- the program exit
set -e

# Senchuk Yurii 
# 18 variant 
# Snya14@gmail.com

# ------------------------- CONSTANTS ----------------------------

ROOT_FOLDER="NEW_SENCHUK"

FIRST_FOLDER="NEW_VARR"
SECOND_FOLDER="NEW_VARS"
THIRD_FOLDER="NEW_VART"

SURNAME_FILE="Senchuk.txt"
NAME_FILE="Yurii.txt"

EMAIL="Snya14@gmail.com"

GROUP_NUMBER=18

EMAIL_REGEX="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}"

# ------------------------- COMMANDS -----------------------------
# ---------- 1 ------------

# check if root folder already exists
if [ -d "$ROOT_FOLDER" ]; then
    echo "[-] The root folder $ROOT_FOLDER already exists."
    exit
fi

mkdir $ROOT_FOLDER

cd $ROOT_FOLDER

mkdir $FIRST_FOLDER $SECOND_FOLDER $THIRD_FOLDER

cd $THIRD_FOLDER

echo "$GROUP_NUMBER $(date +"%D") $EMAIL" > "$SURNAME_FILE"
echo "$GROUP_NUMBER $(date +"%D") $EMAIL" > "$NAME_FILE"

cd ..

echo "[#] First task done."

# ---------- 2 ------------

cp $THIRD_FOLDER/* .

echo "[#] Second task done."

# ---------- 3 ------------

file_data="$(cat $NAME_FILE)"

if [[ "$file_data" =~ $EMAIL_REGEX ]]
then
    echo "[+] The file contains the email address."
else 
    echo "[-] The file doesn't contain the email address."
fi
echo "[#] Third task done."

# return to folder with script
cd .. 

# ---------- 4* -----------

if [ -z "$1" ]
then
    echo "[!] There is no log file as argument."
    echo "[#] Fourth task done."
    exit
fi

# file name like first argument
file_name=${1}

# check if file exists
if ! [ -f "$file_name" ]; then
    echo "[-] $file_name not exists."
    echo "[#] Fourth task done."
    exit
fi

ERROR_404_REGEX="\" 404"

# counter
count_error_messages=0


# read each line in the file
while read line;
do
    if [[ "$line" =~ $ERROR_404_REGEX ]]
    then
        echo "${line}"
        count_error_messages=$(($count_error_messages + 1))
        echo "------------------------------------------------"
    fi
done < $file_name

echo "[!] The lines with error message: $count_error_messages"
echo "[#] Fourth task done."


