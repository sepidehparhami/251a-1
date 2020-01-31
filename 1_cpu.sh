#MicroCPU as cpu parameter and default for the rest

../gem5/build/X86/gem5.opt --outdir 1_cpu/lfsr simple.py --CPU MinorCPU --benchmark lfsr
../gem5/build/X86/gem5.opt --outdir 1_cpu/merge simple.py --CPU MinorCPU --benchmark merge
../gem5/build/X86/gem5.opt --outdir 1_cpu/mm simple.py --CPU MinorCPU --benchmark mm
../gem5/build/X86/gem5.opt --outdir 1_cpu/sieve simple.py --CPU MinorCPU --benchmark sieve
../gem5/build/X86/gem5.opt --outdir 1_cpu/spmv simple.py --CPU MinorCPU --benchmark spmv
