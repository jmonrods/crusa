`timescale 1ns/1ps

module fifo_tb();

    logic       clk;
    logic       rst;
    logic       wr;
    logic       rd;
    logic       full;
    logic       empty;
    logic [7:0] din;
    logic [7:0] dout;

    fifo fifo1 (
        .clk            (clk)   ,
        .rst_n          (rst)   ,
        .wr_en          (wr)    ,
        .rd_en          (rd)    ,
        .full           (full)  ,
        .empty          (empty) ,
        .data_in        (din)   ,
        .data_out       (dout)
    );

    initial begin
        clk <= 0;
        forever #5 clk <= !clk;
    end

    initial begin
        rst <= 0;
        wr <= 0;
        rd <= 0;
        din <= 8'b00000000;

        @(posedge clk);
        @(posedge clk);
        rst <= 1;
    end

    initial begin

        // Esperar 4 clk para reset
        $display("Reset: Esperar 4 ciclos");
        repeat (4) @(posedge clk);

        // Prueba 1: Escritura normal
        $display("Prueba 1: Escritura");
        wr <= 1;
        din <= 8'b00000001;
        @(posedge clk);
        
        din <= 8'b00000010;
        @(posedge clk);

        din <= 8'b00000011;
        @(posedge clk);


        // Prueba 2: Lectura normal
        $display("Prueba 2: Lectura");
        wr <= 0;
        rd <= 1;
        din <= 8'b00000000;
        @(posedge clk);
        
        din <= 8'b00000000;
        @(posedge clk);

        din <= 8'b00000000;
        @(posedge clk);


        // Prueba 3: Intento de escritura cuando está llena
        $display("Prueba 3: Escritura cuando llena");
        wr <= 1;
        rd <= 0;
        repeat(12) begin
            din <= 8'b00000001;
            @(posedge clk);
            din <= din + 1;
        end


        // Prueba 4: Intento de lectura cuando está vacía
        $display("Prueba 4: Lectura cuando vacia");
        wr <= 0;
        rd <= 1;
        repeat(12) @(posedge clk);


        // Prueba 5: Escribir y leer al mismo tiempo
        $display("Prueba 5: Lectura y escritura simultanea");
        wr <= 1;
        rd <= 1;
        din <= 8'b01010101;
        repeat(3) @(posedge clk);

        // Prueba 6: NOP
        $display("Prueba 6: NOP");
        wr <= 0;
        rd <= 0;
        repeat(3) @(posedge clk);

    end

    always @(posedge clk) begin
        $display("time=%t ps\tdout=%b\tempty=%b\tfull=%b",$time,dout,empty,full);
    end

    initial begin
        #400 $finish();
    end


endmodule

