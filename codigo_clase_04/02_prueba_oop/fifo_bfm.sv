`timescale 1ns/1ps

interface fifo_bfm();

    import fifo_pkg::*;
    `include "fifo_macros.svh"

    logic clk, rst_n, wr_en, rd_en, full, empty;
    logic [7:0] data_in, data_out;


    initial begin
        clk = 0;
        forever #5 clk = !clk;
    end


    task reset();
        rst_n = 0;
        @(posedge clk);
        rst_n = 1;
    endtask


    task write(logic [7:0] d);
        data_in = d;
        wr_en = 1;
        rd_en = 0;
        @(posedge clk);
    endtask


    task read();
        wr_en = 0;
        rd_en = 1;
        @(posedge clk);
    endtask


    task readwrite(logic [7:0] d);
        data_in = d;
        wr_en = 1;
        rd_en = 1;
        @(posedge clk);
    endtask


    task no_op();
        wr_en = 0;
        rd_en = 0;
        @(posedge clk);
    endtask


    task print();
        $display("time=%t ps\tdin=%b\tdout=%b\tempty=%b\tfull=%b",$time,data_in,data_out,empty,full);
    endtask


endinterface
