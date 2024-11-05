module lfsr(
    input   logic       clk,
    input   logic       rst,
    input   logic       en,
    output  logic [6:0] data_out
);
logic [7:1] sreg;
always_ff @ (posedge clk, posedge rst)
    if(rst) begin
        sreg <= {6'b0,1'b1};
    end
    else begin
        sreg <={sreg[6:1] , sreg[7] ^ sreg[3]};
    end
assign data_out = sreg;
endmodule
