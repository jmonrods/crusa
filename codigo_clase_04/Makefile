SHELL := /bin/bash
.ONESHELL:

PROJECT_ROOT := $(abspath $(CURDIR)/..)

alu_tb:
	source $(PROJECT_ROOT)/codigo_clase_04/setup.sh
	vlog -sv $(PROJECT_ROOT)/codigo_clase_04/alu.sv $(PROJECT_ROOT)/codigo_clase_04/alu_tb.sv
	vsim -c alu_tb -do "run -all; exit"

fifo_tb:
	source $(PROJECT_ROOT)/codigo_clase_04/setup.sh
	vlog -sv $(PROJECT_ROOT)/codigo_clase_04/fifo.sv $(PROJECT_ROOT)/codigo_clase_04/fifo_tb.sv
	vsim -c fifo_tb -do "run -all; exit"
