SHELL := /bin/bash
.ONESHELL:

PROJECT_ROOT := $(abspath $(CURDIR)/..)

alu_tb:
	source $(PROJECT_ROOT)/codigo_clase_04/setup.sh
	vlog -sv $(PROJECT_ROOT)/codigo_clase_04/alu.sv $(PROJECT_ROOT)/codigo_clase_04/alu_tb.sv
	vsim -c alu_tb -do "run -all; exit"

fifo_tb:
	source $(PROJECT_ROOT)/codigo_clase_04/setup.sh
	vlog -sv $(PROJECT_ROOT)/codigo_clase_04/01_prueba_dirigida/fifo.sv $(PROJECT_ROOT)/codigo_clase_04/01_prueba_dirigida/fifo_tb.sv
	vsim -c fifo_tb -do "run -all; exit"

fifo_oop_tb:
	source $(PROJECT_ROOT)/codigo_clase_04/setup.sh
	vlog -sv -f $(PROJECT_ROOT)/codigo_clase_04/02_prueba_oop/dut.f
	vlog -sv -f $(PROJECT_ROOT)/codigo_clase_04/02_prueba_oop/tb.f
	vopt top -o top_optimized +cover=sbfec
	vsim -sv_seed random -c top_optimized -coverage -do "set NoQuitOnFinish 1; onbreak {resume}; log /* -r; run -all; coverage save -onexit coverage.ucdb; quit;"
	vcover report coverage.ucdb
