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
use Bio::SeqIO;

## replaces problem characters (currently - and |) in seq names with _
## removes single/double quotes
## input can be aligned or unaligned fasta
## usage:  perl preseqconv.pl in.fa out.fa

my ($infi, $oufi) = (shift, shift);
my $ifa = new Bio::SeqIO(-file=> "<$infi", -format=>'fasta');
my $ofa = new Bio::SeqIO(-file=> ">$oufi", -format=>'fasta');
while (my $seq=$ifa->next_seq){
        my $tmpid = $seq->id;
        $tmpid =~ s/-/_/g;
        $tmpid =~ s/\|/_/g;
        $tmpid =~ s/'//g;
        $tmpid =~ s/"//g;
        $tmpid =~ s/\[/ /g;
        $tmpid =~ s/\]/ /g;
	$tmpid =~ s/:/_/g;
        my $newseq = Bio::Seq->new( -seq => $seq->seq,
                                        -id => $tmpid,
        );
        $ofa->write_seq($newseq);
}
