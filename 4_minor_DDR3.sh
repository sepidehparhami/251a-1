#4GHz as clock rate and default for the rest

build/X86/gem5.opt --outdir 4_minor_DDR3/lfsr simple.py --CPU MinorCPU --benchmark lfsr
build/X86/gem5.opt --outdir 4_minor_DDR3/merge simple.py --CPU MinorCPU --benchmark merge
build/X86/gem5.opt --outdir 4_minor_DDR3/mm simple.py --CPU MinorCPU --benchmark mm
build/X86/gem5.opt --outdir 4_minor_DDR3/sieve simple.py --CPU MinorCPU --benchmark sieve
build/X86/gem5.opt --outdir 4_minor_DDR3/spmv simple.py --CPU MinorCPU --benchmark spmv
