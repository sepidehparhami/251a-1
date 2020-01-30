#MicroCPU as cpu parameter and default for the rest

#cd ../cs251a-microbench
#make clean
#make

#cd ../gem5

build/X86/gem5.opt --outdir 1_cpu/lfsr simple.py --cpu MinorCPU --benchmark lfsr
build/X86/gem5.opt --outdir 1_cpu/merge simple.py --cpu MinorCPU --benchmark merge
build/X86/gem5.opt --outdir 1_cpu/mm simple.py --cpu MinorCPU --benchmark mm
build/X86/gem5.opt --outdir 1_cpu/sieve simple.py --cpu MinorCPU --benchmark sieve
build/X86/gem5.opt --outdir 1_cpu/spmv simple.py --cpu MinorCPU --benchmark spmv
