mrmuscle v0.1 released 2014-02-09
Copywright 2014 by Marc Chevrette under the GNU GPLv2
Direct questions and bug reports to:
	chevrm at gmail dot com

README.md last updated 2014-02-09

Summary:
	MrMuscle is a pipeline for the creation of extremely high confidence phylogentic trees 
	leveraging the MUSCLE sequence aligner and MrBayes Bayesian Markov chain Monte Carlo 
	models.

Installation:
	- Download master.zip from github.com/chevrm/mrmuscle
	- Unpack and run ./install-mm from within the master directory

	Note: for systems with bioperl installed from CPAN, source, or methods other than apt, 
	sh ./src/install-nobioperl.sh may be run instead of ./install-mm

Dependancies (installed by install-mm)
	- perl
	- bioperl
	- MUSCLE
	- MrBayes
	- FigTree

Usage:
	mrmuscle input.faa

Pipeline Description:
	- Protein input in fasta format is preprocessed
	- MUSCLE multiple sequence alignment (maximum 1000 iterations)
	- Conversion to Nexus format
	- Postprocessing
	- MCMC tree generation using MrBayes to <0.01 standard deviation or 5M generations
	- Consensus tree summarized using MrBayes
	- Consensus opened in FigTree for user to manipulate tree

Citations:
	seqconv.pl
		seqConverter.pl v1.1
		(c) Olaf R.P. Bininda-Emonds 2006
		http://www.uni-oldenburg.de/en/biology/systematics-and-evolutionary-biology/programs/
	MUSCLE
		Edgar, RC.  2004.  MUSCLE: multiple sequence alignment with high accuracy 
		and high throughput.  Nucleic Acids Research 32(5), 1792-97.
		http://www.drive5.com/muscle
	MrBayes
		Ronquist, F, M Teslenko, P van der Mark, DL Ayres, A Darling, S Höhna, B
                Larget, L Liu, MA Suchard, and JP Huelsenbeck.  2012.  MrBayes 3.2: Efficient 
		Bayesian Phylogenetic Inference and Model Choice across a Large Model Space. 
		Syst Biol (2012).
