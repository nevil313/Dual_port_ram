`timescale 1ns / 1ps

module top();


endmodule

module ain(input din,clk,ld,output reg dout);
always @(posedge clk)
begin
dout<=(ld)?din:0;
end
endmodule

module mux(input din1,din2,sel, output out);
assign out=(sel)?din2:din1;
endmodule

module comp(input a,b,output lt,gt,eq);
assign lt= a<b;
assign gt=a>b;
assign eq = (a==b);
endmodule

module subtract(input a,b,output reg sub);
always@(*)
begin
sub<=a-b;
end
endmodule


module controller(input start, clk , eq ,lt,gt,output reg ldA,ldB,done,sel1,sel2,selin);

parameter s0 =0, s1 =1, s2 =1, s3 =3, s4 =4;
reg [3:0]state;

always @(posedge clk)
begin
case(state)
s0: begin 
    if(start) ldA=1;ldB=0;selin=1;
    state<=s1; end
s1: begin 
    ldA=0;ldB=1;selin=1; end
s2: begin
    if(eq) state<=s3;
    
    else if(lt) begin state<=s2; ldB=1; sel1=1;selin=0; end
    else if(gt) begin state<=s2; ldA=1; sel2=0;selin=0; end
     end   
     
s3: begin done =1 ;ldA=0;ldB=0;sel1=0;sel2=0;selin=0; end
default: begin state<=s0;end    
  endcase  
end
endmodule



