all: # Target name
	Rscript 01-load_data.R
	Rscript 02-methods.R
	Rscript 03-model.R
	Rscript 04-results.R

download: 
	Rscript 01-load_clean.R