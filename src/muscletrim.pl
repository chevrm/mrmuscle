#!/bin/env perl

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

use strict;
use warnings;

## usage:  perl muscletrim.pl alignment > new alignment

my @line = ();
while(<>){
	chomp;
	push @line, $_;
}
my ($fronttrim, $backtrim) = (0,0);
foreach (@line){
	if ($_ =~ m/^(-+)\w+/){
		if(length($1) > $fronttrim){
			$fronttrim = length($1);
		}
	}
	if($_ =~ m/\w+(-+)$/){
		if(length($1) > $backtrim){
			$backtrim = length($1);
		}
	}
}
foreach(@line){
	unless($_ =~ m/^>/){
		$_ = substr($_, $fronttrim);
		$_ = substr($_, 0, 0-$backtrim);
	}
	print "$_\n";
}
