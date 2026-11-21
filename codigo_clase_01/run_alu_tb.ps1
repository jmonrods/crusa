vlib work
vlog -sv alu_tb.sv alu.sv
vsim -c alu_tb -do "run -all; exit"