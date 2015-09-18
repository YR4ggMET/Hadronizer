#!/bin/bash

hadro=/afs/cern.ch/user/r/rateixei/public/forYR4ggMET/Hadronizer/Hadronizer1evt
inputLHE=/afs/cern.ch/work/r/rateixei/work/YR4ggMET/madgraph/MG5_aMC_v2_3_2_2/ggH2NeuNeu2ggGravGrav/Events/run_01/events.lhe.gz
sname=nonres_10GeV
outHepMC=/tmp/${USER}/${sname}.hepmc

delphesdir=/afs/cern.ch/work/r/rateixei/work/YR4ggMET/delphes/CMSSW_7_4_12/src/Delphes-3.2.0/
outDelphes=/afs/cern.ch/work/r/rateixei/work/YR4ggMET/

echo "${hadro} ${inputLHE} ${outHepMC}"

${hadro} ${inputLHE}  ${outHepMC}

echo "Done with Hadronization! Now going to DELPHES..."

cd ${delphesdir}
eval `scramv1 runtime -sh`

echo "./DelphesHepMC cards/delphes_card_CMS.tcl ${outHepMC} ${outDelphes}"

./DelphesHepMC cards/delphes_card_CMS.tcl ${outDelphes} ${outHepMC}
