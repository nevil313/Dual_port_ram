
module div(clk,s,t,z,q);
input clk;
output [1:0]s;
output reg t,z,q;

reg [1:0]a;

initial
a=0;

always@(posedge clk)
begin
if(a!=2'b10)
    a=a+2'b01;
else
    begin
    a=0;
    end

z<=a[1];
t<=~(a[1]|a[0]);
end

always@(posedge clk)
begin
q=t;
end
assign s=a;
endmodule
