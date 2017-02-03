wget https://3230d63b5fc54e62148e-c95ac804525aac4b6dba79b00b39d1d3.ssl.cf1.rackcdn.com/Anaconda-2.3.0-MacOSX-x86_64.sh
bash Anaconda-2.3.0-MacOSX-x86_64.sh
#wget https://3230d63b5fc54e62148e-c95ac804525aac4b6dba79b00b39d1d3.ssl.cf1.rackcdn.com/Anaconda-2.3.0-Linux-x86_64.sh
#bash Anaconda-2.3.0-Linux-x86_64.sh

anaconda/bin/conda create -n rumenEnv python=2.7
source anaconda/bin/activate rumenEnv
conda install -c conda-kapsel conda-kapsel=0.3.12
#conda install -c r r=3.3.2


# conda-kapsel init --directory analysis
# conda kapsel add-command clone "git clone https://github.com/chrisLanderson/2016_Anderson_et_al_JAM"
# conda-kapsel add-packages -c r r=3.3.2 r-rmarkdown=1.2 r-knitr=1.15.1
# conda kapsel add-command render ""