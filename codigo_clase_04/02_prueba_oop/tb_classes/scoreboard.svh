class scoreboard;

    virtual fifo_bfm bfm;

    function new (virtual fifo_bfm b);
        bfm = b;
    endfunction

    task execute();
        
        logic [7:0] predicted_dout = '0;
        logic predicted_full;
        logic predicted_empty;

        logic [7:0] mem[$];

        forever begin : self_checker
            
            @(posedge bfm.clk) #1;

            case( {bfm.wr_en, bfm.rd_en} )
                2'b00: predicted_dout = predicted_dout;
                2'b01: 
                begin
                    if (mem.size > 0) begin predicted_dout = mem.pop_front(); end
                    else begin predicted_dout = predicted_dout; end
                end
                2'b10: 
                begin
                    if (mem.size < 8) begin 
                        mem.push_back(bfm.data_in);
                        predicted_dout = predicted_dout;
                    end
                    else begin predicted_dout = predicted_dout; end
                end
                2'b11: 
                begin
                    mem.push_back(bfm.data_in);
                    predicted_dout = mem.pop_front();
                end
            endcase

            predicted_full  = (mem.size() == 8) ? 1 : 0;
            predicted_empty = (mem.size() == 0) ? 1 : 0;

            if ({predicted_dout,predicted_full,predicted_empty} !== {bfm.data_out,bfm.full,bfm.empty}) $error("FAILED: expected=%b, actual=%b",{predicted_dout,predicted_full,predicted_empty},{bfm.data_out,bfm.full,bfm.empty});
            else $display("PASSED");

        end : self_checker
    
    endtask

endclass
