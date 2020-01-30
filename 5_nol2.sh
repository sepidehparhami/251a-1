#default parameters

build/X86/gem5.opt --outdir 5_nol2/lfsr simple.py --nol2 --benchmark lfsr
build/X86/gem5.opt --outdir 5_nol2/merge simple.py --nol2 --benchmark merge
build/X86/gem5.opt --outdir 5_nol2/mm simple.py --nol2 --benchmark mm
build/X86/gem5.opt --outdir 5_nol2/sieve simple.py --nol2 --benchmark sieve
build/X86/gem5.opt --outdir 5_nol2/spmv simple.py --nol2 --benchmark spmv
