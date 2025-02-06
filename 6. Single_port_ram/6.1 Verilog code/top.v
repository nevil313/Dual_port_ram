module rem(data,add,we,clk,rst,out);

input [3:0]data,add;
input we,rst,clk;
output reg [3:0]out;

reg [3:0]mem[15:0];
integer i;

always@(posedge clk)
begin
if(rst)
   begin
    out<=0;
    for(i=0;i<16;i=i+1)
    begin
        mem[i]<=0;
    end
   end
else
   begin
    if(we)
        mem[add]<=data;
    else
    begin
        out<=mem[add];
        
    end

   end

end

endmodule
