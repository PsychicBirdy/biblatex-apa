#!/bin/bash

find -E . -regex '.*\.(bbx|cbx|dbx|lbx)' | xargs -J % cp % ~/texmf/tex/latex/biblatex-apa/
cp bibtex/bib/*.bib ~/texmf/bibtex/bib/biblatex-apa/

if [[ "$1" == "all" ]]
then
  cd doc
  \rm *.{aux,bbl,bcf,blg,log,run.xml,toc,out,lot,synctex} 2>/dev/null
  lualatex -interaction=batchmode biblatex-apa6.tex
  lualatex -interaction=batchmode biblatex-apa6.tex
  lualatex -interaction=batchmode biblatex-apa6.tex
  lualatex -interaction=batchmode biblatex-apa6-test.tex
  biber --quiet biblatex-apa6-test
  lualatex -interaction=batchmode biblatex-apa6-test.tex
  lualatex -interaction=batchmode biblatex-apa6-test.tex
  \rm *.{aux,bbl,bcf,blg,log,run.xml,toc,out,lot,synctex} 2>/dev/null
  cd ..
  cp doc/biblatex-apa6*.pdf ~/texmf/doc/latex/biblatex-apa/
fi


