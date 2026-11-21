vlib work
vmap work work
vlog -sv -f ./dut.f
vlog -sv -f ./tb.f
vopt top -o top_optimized +cover=sbfec
vsim -sv_seed random -c top_optimized -coverage -do "set NoQuitOnFinish 1; onbreak {resume}; log /* -r; run -all; coverage save -onexit coverage.ucdb; quit;"
vcover report coverage.ucdb