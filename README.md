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
