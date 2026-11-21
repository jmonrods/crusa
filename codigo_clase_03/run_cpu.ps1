vlib work
vmap work work
vlog -sv ./cpu.sv ./uvm_tb/cpu_pkg.sv ./uvm_tb/cpu_bfm.sv ./top.sv +incdir+./uvm_tb
vopt top -o top_optimized +cover=sbfec+cpu
vsim -c +UVM_TESTNAME="random_test" top_optimized -coverage -do "set NoQuitOnFinish 1; onbreak {resume}; log /* -r; run -all; coverage save -onexit coverage.ucdb; quit;"
vcover report coverage.ucdb