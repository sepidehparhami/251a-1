cd ../cs251a-microbench
make clean
make
cd ../gem5


mkdir default
mkdir 1_cpu
mkdir 3_clock
mkdir 4_O3_HBM
mkdir 4_minor_DDR3
mkdir 4_minor_HBM
mkdir 5_nol2

./default.sh &> default/log.txt &
./1_cpu.sh &> 1_cpu/log.txt &
./3_clock.sh &> 3_clock/log.txt &
./4_O3_HBM.sh &> 4_O3_HBM/log.txt &
./4_minor_DDR3.sh &> 4_minor_DDR3/log.txt &
./4_minor_HBM.sh &> 4_minor_HBM/log.txt &
./5_nol2.sh &> 5_nol2/log.txt &


cd ../cs251a-microbench
make clean
make OPT=-O1
cd ../gem5

mkdir 2_compile_O1
./2_compile_O1.sh &> 2_compile_O1/log.txt &


cd ../cs251a-microbench
make clean
make OPT="-O2 -ffast-math -ftree-vectorize"
cd ../gem5

mkdir 2_compile_O2
./2_compile_O2.sh &> 2_compile_O2/log.txt &
