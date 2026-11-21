`timescale 1ns/1ps

module top();

    import fifo_pkg::*;
    `include "fifo_macros.svh"   
     
    `include "coverage.svh"
    `include "tester.svh"
    `include "scoreboard.svh"
    `include "testbench.svh"

    fifo fifo1 (
        .rst_n     (bfm.rst_n),
        .clk       (bfm.clk),
        .wr_en     (bfm.wr_en),
        .rd_en     (bfm.rd_en),
        .full      (bfm.full),
        .empty     (bfm.empty),
        .data_in   (bfm.data_in),
        .data_out  (bfm.data_out)
    );

    fifo_bfm bfm ();

    testbench testbench_h;

    initial begin
        testbench_h = new(bfm);
        testbench_h.execute();
    end

endmodule
