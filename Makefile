all: website

slides_targets := $(wildcard slides/*.qmd)
slides: $(slides_targets)
	quarto render $? --to revealjs

website: 
	quarto render .


clean:
	rm -rf docs
	mkdir docs
	quarto render . 

export: 
	cp .htaccess docs/
	rsync -avze ssh --progress --delete ./docs/ vitay@login.tu-chemnitz.de:/afs/tu-chemnitz.de/www/root/informatik/KI/edu/deeprl/notes/	
