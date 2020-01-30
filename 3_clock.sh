#4GHz as clock rate and default for the rest

build/X86/gem5.opt --outdir 3_clock/lfsr simple.py --frequency 4GHz --benchmark lfsr
build/X86/gem5.opt --outdir 3_clock/merge simple.py --frequency 4GHz --benchmark merge
build/X86/gem5.opt --outdir 3_clock/mm simple.py --frequency 4GHz --benchmark mm
build/X86/gem5.opt --outdir 3_clock/sieve simple.py --frequency 4GHz --benchmark sieve
build/X86/gem5.opt --outdir 3_clock/spmv simple.py --frequency 4GHz --benchmark spmv
