module f1_fsm (
    input   logic       rst,
    input   logic       en,
    input   logic       clk,
    output  logic [7:0] data_out
);

logic [8:1] fsm;
always_ff @ (posedge clk, posedge rst)
    if (rst) begin
        fsm <=0;
    end
    else if(en) begin
        if (fsm == 255) begin
            fsm <=0;
        end
        else begin
            fsm <= {fsm[7:1], 1'b1};
        end
    end

assign data_out = fsm;
endmodule
