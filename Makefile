all: data/created/master.csv \
     README.md


data/created/master.csv: data/downloaded/FEK_download.csv script/create.sh
	script/create.sh


README.md: README.rmd
	Rscript -e 'rmarkdown::render("README.rmd")'

