#Hadronizer!

## Instructions

This code should work on CMSSW and any other platform, given that you have all that is needed installed.

### Pythia installation

First, download pythia8:
```
wget http://home.thep.lu.se/~torbjorn/pythia8/pythia8210.tgz   
tar -xzvf pythia8210.tgz   
cd pythia8210
```
To configure pythia, we have to make it use HepMC and gzip:   
```
./configure --with-hepmc2=/afs/cern.ch/sw/lcg/releases/HepMC/2.06.09-0a23a/x86_64-slc6-gcc48-opt/ --with-gzip
```

Here,   
```
"/afs/cern.ch/sw/lcg/releases/HepMC/2.06.09-0a23a/x86_64-slc6-gcc48-opt/"
```
is the address of HepMC at afs. If you have installed it locally, change this accordingly.

Then, just compile:   
```
make
```
### Running Hadronizer

Now, you have to copy Hadronizer.cc to the examples directory on your installation of Pythia 8.   
After you do that, you will have to add it to the Makefile in the proper location.   
Open **examples/Makefile** in your favorite text editor. Under the **RULES** section, look for the **# HEPMC2** flag.   
After the list of examples (main41 main42 main43 main85 main86 main87 main88 main89) add "Hadronizer":   
```
"main41 main42 main43 main85 main86 main87 main88 main89 Hadronizer:" 
```
Now you should be able to compile the Hadronizer code:   
```
make Hadronizer
```
And finally, run it:   
```
./Hadronizer <LHE file> <HepMC output>
```
LHE file can either be .lhe and also .gz if you configured pythia with the --with-gzip flag.

#DELPHES!

## Instructions

First, install DELPHES ( https://cp3.irmp.ucl.ac.be/projects/delphes/wiki/WorkBook/QuickTour)

```
wget http://cp3.irmp.ucl.ac.be/downloads/Delphes-3.2.0.tar.gz
tar -zxf Delphes-3.2.0.tar.gz

cd Delphes-3.2.0
make -j 4
```

Run on HepMC output of Hadronizer with CMS card:

```
./DelphesHepMC cards/delphes_card_CMS.tcl output.root input.hepmc
```

#Hadronizer+DELPHES Combo for batch

File batch_HadronizeAndDELPHES.sh is a script that can be run on batch (with CMSSW). It has some parameters that can be adjusted:
```
hadro= location of the hadronizer executable
inputLHE= LHE files you produced
sname= name of the sample you produced
outHepMC= output location of the hadronizer
delphesdir= directory where you have the DELPHES executables
outDelphes= output location of DELPHES
```

For running on lxbatch, you don't need to change **hadro and outHepMC**. It will automatically put the HepMC files on your /tmp/USER/ directory (HepMC files are very large and won't be used for anything else).  

If you're running on CMS lxplus, you can access my public directory and use my pre-compiled Hadronizer, so you don't need the #Hadronizer step. My pre-compiled hadronizer is the default value on the batch file.

## Submit to lxbatch

Just a reminder: change hadJob to have different job names for different samples you're producing!

```
bsub -q 8nh -J hadJob < batch_HadronizeAndDELPHES.sh
```

