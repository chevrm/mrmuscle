#!/bin/sh

#    Copyright 2014 Marc Chevrette
#
#    This file is part of mrmuscle
#
#    mrmuscle is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details. 
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.

## installer file for mrmuscle
## will invoke sudo and ensure the following are installed:
##	perl
##	bioperl
##	muscle
##	figtree
##	mrbayes

cd ./src
directoryx="$(dirname -- $(readlink -fn -- "$0"; echo x))"
directory="${directoryx%x}"
sudo apt-get install perl bioperl muscle figtree
#wget http://sourceforge.net/projects/mrbayes/files/mrbayes/3.2.2/mrbayes-3.2.2.tar.gz
tar zxvf mrbayes-3.2.2.tar.gz
#rm mrbayes-3.2.2.tar.gz
cd mrbayes_3.2.2/src
autoconf
./configure --with-beagle=no
make
sudo make install
ln -s $directory/mrbayes_3.2.2/src/mb $directory/mrbayes
cd $directory
ln -s $directory/mrmuscle.pl ../mrmuscle
