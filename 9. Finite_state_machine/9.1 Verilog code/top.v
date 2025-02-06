`timescale 1ns/1ps

module top(din,clk,rst,dout);

input din,clk,rst;
output reg dout;
 
parameter s0=0;
parameter s1=1;
parameter s2=2;
parameter s3=3;
parameter s4=4;


reg [2:0]st=s0,nst=s0;
always@(posedge clk)
begin
if(rst)
    st=s0;
else
    nst=st;
end

always@(din,st)
begin
case(st)

s0: begin if(din) nst=s1; else nst=s0; end
s1: begin if(din) nst=s1; else nst=s2; end
s2: begin if(din) nst=s1; else nst=s3; end
s3: begin if(din) nst=s4; else nst=s0; end
s4: begin if(din) nst=s1; else  begin nst=s0; end dout<=1; end

default dout<=0;

endcase
end
endmodule
