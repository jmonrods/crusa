vlib work
vlog -sv cpu_tb.sv cpu.sv
vsim -c cpu_tb -do "run -all; exit"