#!/bin/bash

if [ "$1" = "" ]; then
    printf "\nProvide a link for USEARCH download (from email) as argument.\nGet a license from http://www.drive5.com/usearch/download.html\nSee RMarkdown file for details.\n\n"
    exit 1
fi

wget https://repo.continuum.io/miniconda/Miniconda2-4.2.12-MacOSX-x86_64.sh
bash Miniconda2-4.2.12-MacOSX-x86_64.sh -b -p anaconda
#wget https://repo.continuum.io/miniconda/Miniconda2-4.2.12-Linux-x86_64.sh
#bash Miniconda2-4.2.12-Linux-x86_64.sh -b -p anaconda

# anaconda/bin/conda list -n rumenEnv --export > conda_packages.txt
anaconda/bin/conda create -y -n rumenEnv --file conda_packages.txt -c bioconda -c r -c biobuilds
source anaconda/bin/activate rumenEnv

wget -O anaconda/envs/rumenEnv/bin/usearch $1
chmod 775 anaconda/envs/rumenEnv/bin/usearch

Rscript -e "rmarkdown::render('acclimation.Rmd')"








