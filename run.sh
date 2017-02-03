#!/bin/bash

if [ "$1" = "" ]; then
    printf "\nProvide a link for USEARCH download (from email) as argument.\nGet a license from http://www.drive5.com/usearch/download.html\nSee RMarkdown file for details.\n\n"
    exit 1
fi

wget https://3230d63b5fc54e62148e-c95ac804525aac4b6dba79b00b39d1d3.ssl.cf1.rackcdn.com/Anaconda-2.3.0-MacOSX-x86_64.sh
bash Anaconda-2.3.0-MacOSX-x86_64.sh
#wget https://3230d63b5fc54e62148e-c95ac804525aac4b6dba79b00b39d1d3.ssl.cf1.rackcdn.com/Anaconda-2.3.0-Linux-x86_64.sh
#bash Anaconda-2.3.0-Linux-x86_64.sh

git clone https://github.com/chrisLanderson/2016_Anderson_et_al_JAM
cd 2016_Anderson_et_al_JAM


anaconda/bin/conda create -y -n rumenEnv python=2.7
source anaconda/bin/activate rumenEnv
anaconda/bin/conda install -y --file conda_packages.txt -c bioconda -c r -c biobuilds

wget -O anaconda/envs/rumenEnv/bin/usearch $1
chmod 775 anaconda/envs/rumenEnv/bin/usearch

"Rscript -e "rmarkdown::render('acclimation.Rmd')""


#anaconda/bin/conda create -y -n rumenEnv python=2.7
#source anaconda/bin/activate rumenEnv
#anaconda/bin/conda install -y -c bioconda qiime=1.9.1 fastx_toolkit=0.0.14
#anaconda/bin/conda install -y -c r r=3.3.2 r-rmarkdown=1.2 r-knitr=1.15.1
#anaconda/bin/conda install -y -c biobuilds mothur=1.38.1
#anaconda/bin/conda install -y -c r r-packrat=0.4.8_1


#anaconda/bin/conda list -n rumenEnv --export > conda_packages.txt
