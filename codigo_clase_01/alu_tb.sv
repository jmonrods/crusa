module alu_tb();

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

    initial begin
        
        #10;
        A = 5;
        B = 3;
        op = 3'b000; // suma
        $display("A = %d, B = %d, op = %b,Q = %d", A, B, op, Q);

        #10;
        A = 5;
        B = 3;
        op = 3'b001; // resta
        $display("A = %d, B = %d, op = %b,Q = %d", A, B, op, $signed(Q));

        #10;
        A = 5;
        B = 3;
        op = 3'b000; // suma
        $display("A = %d, B = %d, op = %b,Q = %d", A, B, op, Q);

        #10;
        A = 5;
        B = 3;
        op = 3'b001; // resta
        $display("A = %d, B = %d, op = %b,Q = %d", A, B, op, $signed(Q));

        $finish();

    end
endmodule
