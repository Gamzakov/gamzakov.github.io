#!/bin/bash

rm Packages
rm Packages.bz2

dpkg-scanpackages --multiversion ./debs > Packages
bzip2 -fks Packages

echo "Done. Run Git.sh"