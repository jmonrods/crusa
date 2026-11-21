class coverage;

    virtual fifo_bfm bfm;

    covergroup normal_write;
        coverpoint (bfm.wr_en & !bfm.rd_en & !bfm.full) {
            bins hit = {1'b1};
        }
    endgroup

    covergroup normal_read;
        coverpoint (!bfm.wr_en & bfm.rd_en & !bfm.empty) {
            bins hit = {1'b1};
        }
    endgroup

    covergroup write_when_full;
        coverpoint (bfm.wr_en & !bfm.rd_en & bfm.full) {
            bins hit = {1'b1};
        }
    endgroup

    covergroup read_when_empty;
        coverpoint (!bfm.wr_en & bfm.rd_en & bfm.empty) {
            bins hit = {1'b1};
        }
    endgroup

    covergroup read_and_write;
        coverpoint (bfm.wr_en & bfm.rd_en) {
            bins hit = {1'b1};
        }
    endgroup

    covergroup no_op;
        coverpoint (!bfm.wr_en & !bfm.rd_en) {
            bins hit = {1'b1};
        }
    endgroup


    function new (virtual fifo_bfm b);
        bfm = b;
        normal_write = new();
        normal_read = new();
        write_when_full = new();
        read_when_empty = new();
        read_and_write = new();
        no_op = new();
    endfunction


    task execute();
        forever begin
            @(posedge bfm.clk) #1;
            normal_write.sample();
            normal_read.sample();
            write_when_full.sample();
            read_when_empty.sample();
            read_and_write.sample();
            no_op.sample();
        end
   endtask

endclass
