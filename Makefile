all: cux.gen.hfst 

cux.lexc.hfst: cux.lexc
	hfst-lexc $< -o $@

cux.twol.hfst: cux.twol
	hfst-twolc $< -o $@

cux.gen.hfst: cux.twol.hfst cux.lexc.hfst
	hfst-compose-intersect -1 cux.lexc.hfst -2 cux.twol.hfst -o $@
