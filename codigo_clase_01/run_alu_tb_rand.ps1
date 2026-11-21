vlib work
vlog -sv +cover=bcesfx alu_tb_rand.sv alu.sv
vopt +cover=bcesfx alu_tb_rand -o alu_tb_rand_opt
vsim -c -coverage alu_tb_rand_opt -do "coverage report -file coverage.txt; coverage save alu.ucdb; run -all; exit"
vcover report -details alu.ucdb