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

for folder in ./projects/*
do
    for debFolder in $folder/*
    do
        if contains $debFolder packages
        then
            if [ -f $debFolder/*.deb ]
            then
                for file in $debFolder/*.deb
                do
                    echo "cp ${file} to ./debs"
                    cp $file ./debs/
                done
            fi
        fi
    done
done

rm Packages
rm Packages.bz2

dpkg-scanpackages ./debs > Packages
bzip2 -fks Packages