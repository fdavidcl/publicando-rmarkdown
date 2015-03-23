all: lhs lpy

lpy: litpython.pdf

litpython.pdf: litpython.md
	pandoc --to latex $< -o $@

litpython.md: litpython.lpy
	pweave $< -i noweb -f pandoc -m


lhs: lithaskell.pdf lithaskell

lithaskell: lithaskell.lhs
	ghc $< -o $@

lithaskell.pdf: lithaskell.lhs
	pandoc --to latex --from markdown+lhs $< -o $@
    
.PHONY: lhs
