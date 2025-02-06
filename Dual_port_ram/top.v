module top(clk,rst,we_a,we_b,re_a,re_b,data_a,data_b,add_a,add_b,out_a,out_b);

input clk,rst,we_a,we_b,re_a,re_b;
input [7:0]data_a,data_b;
input [3:0]add_a,add_b;

output reg [7:0]out_a,out_b;

reg [7:0]mem[15:0];
integer i;


always@(posedge clk)
begin
if(rst)
    begin
    for(i=0;i<65;i=i+1)
        begin
        mem[i]=0;
        end
    end
else if(we_a & mem[add_a]==0)
    begin
    mem[add_a]<=data_a;
    end

else
    begin
    if(re_a)
        begin
        out_a<=mem[add_a];
        mem[add_a]<=0;
        end
    else
        mem[add_a]<=mem[add_a];
    end
end

always@(posedge clk)
begin
if(we_b & mem[add_b]==0 & add_b > 3'd3)
    begin
    mem[add_b]<=data_b;
    end 
else 
    begin
    if(re_b)
        begin
        out_b=mem[add_b];
        mem[add_b]<=0;
        end
    else
      mem[add_b]<=mem[add_b];
    end 
    end

always@(posedge clk)
begin
    if(we_a & we_b & add_a==add_b)
        mem[add_a]<=data_a;
    else
    begin
        mem[add_a]<=mem[add_a];
        mem[add_b]<=mem[add_b];
    end
end

endmodule

