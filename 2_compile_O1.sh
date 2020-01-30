#default parameters

build/X86/gem5.opt --outdir 2_compile_O1/lfsr simple.py --benchmark lfsr
build/X86/gem5.opt --outdir 2_compile_O1/merge simple.py --benchmark merge
build/X86/gem5.opt --outdir 2_compile_O1/mm simple.py --benchmark mm
build/X86/gem5.opt --outdir 2_compile_O1/sieve simple.py --benchmark sieve
build/X86/gem5.opt --outdir 2_compile_O1/spmv simple.py --benchmark spmv
