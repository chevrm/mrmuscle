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

## appends naked nexus file with mb (mrbayes) script for mcmc tree generation
## usage:  perl nexappmb.pl file.nex ngen(int) burnin(int)

my ($nex, $ngen) = (shift, shift);
open my $ofh, '>>', $nex or die $!;
print $ofh "\n" .
        'begin mrbayes;' . "\n" .
        'lset nst=mixed rates=gamma;' . "\n" .
        'mcmc ngen=' . $ngen . ' samplefreq=100 nchains=4 diagnfreq=500 stoprule=yes stopval=0.01;' . "\n" .
        'sumt contype=halfcompat relburnin=yes burninfrac=0.25 showtreeprobs=yes;' . "\n" .
        'end;';
close $ofh;
