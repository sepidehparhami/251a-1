#default parameters

cd ../cs251a-microbench
make clean
make

cd ../gem5

build/X86/gem5.opt --outdir default/lfsr simple.py --benchmark lfsr
build/X86/gem5.opt --outdir default/merge simple.py --benchmark merge
build/X86/gem5.opt --outdir default/mm simple.py --benchmark mm
build/X86/gem5.opt --outdir default/sieve simple.py --benchmark sieve
build/X86/gem5.opt --outdir default/spmv simple.py --benchmark spmv
