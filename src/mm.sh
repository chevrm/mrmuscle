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

directoryx="$(dirname -- $(readlink -fn -- "$0"; echo x))"
directory="${directoryx%x}"
perl $directory/mrmuscle.pl $1
