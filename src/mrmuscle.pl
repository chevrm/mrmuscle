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

## usage:  perl mrmuscle.pl file.fa

my $fasta = shift;
my $ngen = 5000000;
open my $ffh, '<', $fasta or die $!;
my $seqc = 0;
while (<$ffh>){
        if ($_ =~ m/^>/){
                $seqc++;
        }
}
close $ffh or die $!;
my $root = $fasta;
$root =~ s/.fasta//g;
$root =~ s/.fa+//g;
$root =~ s/.aa//g;
system("muscle -in $fasta -out $root.afa -maxiters 1000");
system("perl ~/bin/preseqconv.pl $root.afa $root.fi.afa");
system("perl ~/bin/seqconv.pl -d$root.fi.afa -if -on");
system("perl ~/bin/seqconv.pl -d$root.fi.afa -if -opc");
system("perl ~/bin/nexdna2prot.pl $root.fi.nex > $root.fi.prot.nex");
my $quart = sprintf("%.0f", 0.25*$seqc);
system("perl ~/bin/nexappmb.pl $root.fi.prot.nex $ngen $quart");
open my $sfh, '<', 'srcdir.txt';
my $srcdir = $0;
$srcdir =~ s/\mrmuscle.pl//;
system("$srcdir/mrbayes $root.fi.prot.nex");
system("figtree $root.fi.prot.nex.con.tre");
