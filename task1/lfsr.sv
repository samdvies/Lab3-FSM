module lfsr(
    input   logic       clk,
    input   logic       rst,
    input   logic       en,
    output  logic [3:0] data_out
);
logic [4:1] sreg;
always_ff @ (posedge clk, posedge rst)
    if(rst) begin
        sreg <= 1;
    end
    else begin
        sreg <= {sreg[3:1], sreg[4] ^ sreg[3]};
    end
assign data_out = sreg;
endmodule
