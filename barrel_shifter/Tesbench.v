`timescale 1ns /1ps

module Testbench;
reg [3:0]q;
reg [1:0]sel;
wire [3:0]shifted_q;
integer i;

top dut(q,sel,shifted_q);

initial
begin
for(i=0;i<4;i=i+1)
begin
q=$urandom_range(0,15);
sel=i;
#30;

end

end

endmodule
