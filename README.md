This is an updated analysis of Anderson et al. JAM manuscript "[Rumen bacterial communities can be acclimated faster to high concentrate diets than currently implemented feedlot programs] (http://onlinelibrary.wiley.com/doi/10.1111/jam.13039/full)". The outputs generated through this analysis are identical to those of the [original analysis] (https://github.com/chrisLanderson/old_Anderson_et_al_JAM_Acclimation). Updated analysis was conducted to mostly attempt better coding and reproducible research practices.

The R Markdown file in this repository contains the code for the analysis. Due to licensing issues, USEARCH can not be included in the setup to download automatically. To obtain a download link, go to the USEARCH [download page](http://www.drive5.com/usearch/download.html and select version USEARCH v7.0.1090 for Mac OSX. Our current work has moved to vsearch, an open source alternative to USEARCH, but for reproducibility of the original work USEARCH is still implemented in the current analysis.

To start the analysis:

	git clone https://github.com/chrisLanderson/2016_Anderson_et_al_JAM
	cd 2016_Anderson_et_al_JAM
	bash run.sh usearch_link

The analysis is setup to run in a Mac OS X environment, but can be easily switched to run in linux by uncommenting/commenting the appropriate lines in run.sh for anaconda installation and downloaded a linux version of USEARCH.

A version of the rendered document is found in the repository - insert.
