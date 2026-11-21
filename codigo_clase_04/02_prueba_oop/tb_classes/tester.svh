// tester: drives stimulus
class tester;
    
    virtual fifo_bfm bfm;

    function new (virtual fifo_bfm b);
        bfm = b;
    endfunction

    task execute();

        bfm.reset();

        // Prueba 1
        repeat (3) begin
            bfm.write(8'b00000011);
            bfm.print();
        end

        // Prueba 2
        repeat (3) begin
            bfm.read();
            bfm.print();
        end

        // Prueba 3
        repeat (12) begin
            bfm.write(8'b00000011);
            bfm.print();
        end

        // Prueba 4
        repeat (12) begin
            bfm.read();
            bfm.print();
        end
        
        // Prueba 5
        repeat (3) begin
            bfm.readwrite(8'b00000011);
            bfm.print();
        end
        
        // Prueba 6
        repeat(3) begin
            bfm.no_op();
            bfm.print();
        end

        $finish();
        
    endtask : execute

endclass