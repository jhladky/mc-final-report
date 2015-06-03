SHELL := /bin/bash

all: report

report: report.tex
	@pdflatex -interaction=nonstopmode report.tex > .tmp || (cat .tmp; exit 1)
	@pdflatex -interaction=nonstopmode report.tex > .tmp || (cat .tmp; exit 1)
	@scp report.pdf host:~/Desktop/ > /dev/null
	@rm .tmp


clean:
	@rm -f report.{aux,log,out,pdf,toc}
