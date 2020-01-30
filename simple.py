import m5
from m5.objects import *
import argparse

m5.util.addToPath('configs/')
from caches import *

parser = argparse.ArgumentParser()
parser.add_argument('--CPU', type=str, default='DerivO3CPU',choices=['DerivO3CPU','MinorCPU'])
parser.add_argument('--frequency', type=str, default='1GHz', choices=['1GHz','4GHz'])
parser.add_argument('--memctrl', type=str, default='DDR3_1600_8x8', choices=['DDR3_1600_8x8','HBM_1000_4H_1x64'])
parser.add_argument('--nol2',action='store_true')
parser.add_argument('--benchmark', type=str, choices=['mm','spmv','lfsr','merge','sieve'])



args = parser.parse_args()

mysystem = System()

mysystem.clk_domain = SrcClockDomain()
mysystem.clk_domain.clock = args.frequency
mysystem.clk_domain.voltage_domain = VoltageDomain()

mysystem.mem_mode = 'timing'

mysystem.mem_ranges = [AddrRange('512MB')]

if args.CPU == 'MinorCPU':
    mysystem.cpu = MinorCPU()
else:
    mysystem.cpu = DerivO3CPU()


#create L1 caches
mysystem.cpu.icache = L1ICache()
mysystem.cpu.icache.size = '128kB'
mysystem.cpu.dcache = L1DCache()
mysystem.cpu.dcache.size = '128kB'

#connect L1 caches to CPU
mysystem.cpu.icache.connectCPU(mysystem.cpu)
mysystem.cpu.dcache.connectCPU(mysystem.cpu)

mysystem.membus = SystemXBar()

if not args.nol2:
    #create memory bus
    mysystem.l2bus = L2XBar()

    #hook up CPU ports to L2 bus
    mysystem.cpu.icache.connectBus(mysystem.l2bus)
    mysystem.cpu.dcache.connectBus(mysystem.l2bus)

    mysystem.l2cache = L2Cache()
    mysystem.l2cache.size = '1MB'

    mysystem.l2cache.connectCPUSideBus(mysystem.l2bus)

    mysystem.l2cache.connectMemSideBus(mysystem.membus)

else:
    mysystem.cpu.icache.connectBus(mysystem.membus)
    mysystem.cpu.dcache.connectBus(mysystem.membus)


mysystem.cpu.createInterruptController()
mysystem.cpu.interrupts[0].pio = mysystem.membus.master
mysystem.cpu.interrupts[0].int_master = mysystem.membus.slave
mysystem.cpu.interrupts[0].int_slave = mysystem.membus.master

mysystem.system_port = mysystem.membus.slave

if args.memctrl == 'HBM_1000_4H_1x64':
    mysystem.mem_ctrl = HBM_1000_4H_1x64()
else:
    mysystem.mem_ctrl = DDR3_1600_8x8()


mysystem.mem_ctrl.range = mysystem.mem_ranges[0]
mysystem.mem_ctrl.port = mysystem.membus.master #hook controller up to membus

process = Process()
dir = '../cs251a-microbench/' + args.benchmark
process.cmd = [dir]
mysystem.cpu.workload = process
mysystem.cpu.createThreads()

root = Root(full_system=False, system=mysystem)

m5.instantiate()

print("Beginning simulation with parameters %s" % (args))
exit_event = m5.simulate()

print("Done simulating at tick %d because %s" % (m5.curTick(), exit_event.getCause()))
