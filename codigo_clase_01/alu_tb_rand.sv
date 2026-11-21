`timescale 1ns/1ps
module alu_tb_rand();

    logic [2:0] op;
    logic [31:0] A;
    logic [31:0] B;
    logic [31:0] Q;

    alu alu1 (
        .ALUControl   (op),
        .A            (A),
        .B            (B),
        .Result       (Q),
        .oVerflow     (),
        .Carry        (),
        .Negative     (),
        .Zero         ()
    );

    covergroup alu_op_cov();
        coverpoint op;
    endgroup

    initial begin
        
        alu_op_cov ck;
        ck = new();

        repeat(40) begin
            #10;
            A = $random();
            B = $random();
            op = $random();
            $display("A = %d, B = %d, op = %b,Q = %d", A, B, op, Q);
            ck.sample();
        end
        
        $finish();

    end
endmodule
