#!/bin/bash

if [ "$1" = "" ]; then
    printf "\nProvide a link for USEARCH download (from email) as argument.\nGet a license from http://www.drive5.com/usearch/download.html\nSee RMarkdown file for details.\n\n"
    exit 1
fi

wget https://repo.continuum.io/miniconda/Miniconda2-4.2.12-MacOSX-x86_64.sh
bash Miniconda2-4.2.12-MacOSX-x86_64.sh -b -p anaconda
# wget https://repo.continuum.io/miniconda/Miniconda2-4.2.12-Linux-x86_64.sh
# bash Miniconda2-4.2.12-Linux-x86_64.sh -b -p anaconda

# anaconda/bin/conda list -n qiime --export > conda_qiime_packages.txt
# anaconda/bin/conda list -n r --export > conda_r_packages.txt
anaconda/bin/conda create -y -n qiime --file conda_qiime_packages.txt -c bioconda -c r -c biobuilds
anaconda/bin/conda create -y -n r --file conda_r_packages.txt -c bioconda -c r -c biobuilds
source anaconda/bin/activate qiime

wget -O anaconda/envs/qiime/bin/usearch $1
chmod 775 anaconda/envs/qiime/bin/usearch

anaconda/envs/r/bin/Rscript -e "rmarkdown::render('acclimation.Rmd')"