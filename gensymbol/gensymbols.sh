#!/bin/bash

perl ./gensymbol osx x86_64 _ 1 0  0 0 0 0 "" "" 1 0 1 1 1 1 > tempsymbols.def

echo "#define JL_EXPORTED_FUNCS(XX) \\"
for s in `cut -b2-100 tempsymbols.def`; do
    echo XX\(${s}64_\) \\;
done

rm -f *.def