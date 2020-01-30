#4GHz as clock rate and default for the rest

build/X86/gem5.opt --outdir 4_minor_HBM/lfsr simple.py --CPU MinorCPU --memctrl HBM_1000_4H_1x64 --benchmark lfsr
build/X86/gem5.opt --outdir 4_minor_HBM/merge simple.py --CPU MinorCPU --memctrl HBM_1000_4H_1x64 --benchmark merge
build/X86/gem5.opt --outdir 4_minor_HBM/mm simple.py --CPU MinorCPU --memctrl HBM_1000_4H_1x64 --benchmark mm
build/X86/gem5.opt --outdir 4_minor_HBM/sieve simple.py --CPU MinorCPU --memctrl HBM_1000_4H_1x64 --benchmark sieve
build/X86/gem5.opt --outdir 4_minor_HBM/spmv simple.py --CPU MinorCPU --memctrl HBM_1000_4H_1x64 --benchmark spmv
