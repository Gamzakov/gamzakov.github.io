#!/bin/bash

contains() {
    string="$1"
    substring="$2"
    if test "${string#*$substring}" != "$string"
    then
        #echo "String: ${string}, SubString ${substring}, Return: 1"
        return 0    # $substring is in $string
    else
        #echo "String: ${string}, SubString ${substring}, Return: 0"
        return 1    # $substring is not in $string
    fi
}

for debsFolder in ./debs/*
do
    if contains $debsFolder packages
    then
        echo "DebsFolder: ${debsFolder}"
        for debFile in $debsFolder/*.deb
        do
            echo "DebFile: ${debFile}"
            mv $debFile ./debs
        done

        rm -r $debsFolder
    fi    
done

rm Packages
rm Packages.bz2

dpkg-scanpackages --multiversion ./debs > Packages
bzip2 -fks Packages

echo "Files added to git. Next step commit and then push."