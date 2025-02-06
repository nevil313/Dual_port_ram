`timescale 1ns / 1ps

module top(input A,B,ldA,ldB,ldP,dec,clrp,clk,output eqz);
wire A_out, B_out ,sum, out;

inA s(A,clk,ldA,A_out);
inB v(B,clk,ldB,dec,B_out);
P  ab(sum,clk,ldP,clrp,out);
add Z(A_out,B_out,sum);

compare ab0(B_out,eqz);

endmodule

module inA(input din, clk , ld , output reg dout);
always @(posedge clk)
begin
if(ld)
    dout<=din;
else
    dout<=0;    
end
endmodule 

module inB(input din,clk,ld,dec, output reg dout);
always @(posedge clk)
begin
if(ld)
    dout<=din;
else if(dec)
    dout<=dout-1;
else
    dout<=0;
end
endmodule

module P(input din,clk,ld,clr, output reg dout);
always@(posedge clk)
begin
if(clr)
    dout<=0;
else if(ld)
    dout<=din;
else
    dout<=0;        
end
endmodule

module add(input din1,din2,output reg out);
always@(*) begin out= din1+ din2; end
endmodule

module compare(input din,output out);
assign out=(din==0)?1:0;
endmodule


module control(input clk,eqz,start,output reg ldA,ldB,ldP,clrp,dec,done);

parameter s0=0,s1=1,s2=2,s3=3,s4=4;
reg [3:0]state;

always @(posedge clk)
begin
case(state)
s0: begin
     ldA=0; ldB=0; ldP=0; clrp=0; dec=0;state<=s1; end
     
s1: begin
     if(start) ldA=1; ldB=0; ldP=0; clrp=0; dec=0;state<=s2; end     
s2: begin
     ldA=0; ldB=1; ldP=0; clrp=1; dec=0;state<=s3; end
s3: begin
     ldA=0; ldB=0; ldP=1; clrp=0; dec=1;if(eqz) state<=s4;else state<=state; end
s4: begin
     ldA=0; ldB=0; ldP=0; clrp=1; dec=0;done=1; end
default : begin
     ldA=0; ldB=0; ldP=0; clrp=1; dec=0;state<=s0; end
endcase
end
endmodule 
