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

## usage:  perl mrmuscle.pl file.fa (-nt)

my $fasta = shift;
my $nt = 0;
foreach (@ARGV){
	if ($_ eq '-nt'){
		$nt=1;
	}
}
my $mmdir = $0;
$mmdir =~ s/mrmuscle$//;
$mmdir =~ s/src\/mrmuscle.pl$//;
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
unless ($nt == 1){
	system("perl $mmdir/src/muscletrim.pl $root.afa > $root.trim.afa");
	$root = "$root.trim";
}
system("perl $mmdir/src/preseqconv.pl $root.afa $root.fi.afa");
system("perl $mmdir/src/seqconv.pl -d$root.fi.afa -if -on");
system("perl $mmdir/src/seqconv.pl -d$root.fi.afa -if -opc");
system("perl $mmdir/src/nexdna2prot.pl $root.fi.nex > $root.fi.prot.nex");
my $quart = sprintf("%.0f", 0.25*$seqc);
system("perl $mmdir/src/nexappmb.pl $root.fi.prot.nex $ngen $quart");
system("$mmdir/src/mrbayes $root.fi.prot.nex");
system("figtree $root.fi.prot.nex.con.tre");
