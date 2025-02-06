`timescale 1ns/1ps

module test;
reg [3:0]data=0,add;
wire [3:0]out;
reg we=0,clk=0,rst=0;
integer i;

rem dut(data,add,we,clk,rst,out);


task reset;
begin
rst = 1;
we = 0;
add = 0;
data = 0;
repeat(5) @(posedge clk);
end
endtask


always #20 clk=~clk;

task write;
begin
we=1;
rst=0;
@(posedge clk)
for(i=0;i<25;i=i+1)
begin
data=$urandom();
add=$urandom();
@(posedge clk);
end
end
endtask


task read;
begin
we=0;
rst=0;
@(posedge clk)
for(i=0;i<25;i=i+1)
begin
add=$urandom();
@(posedge clk);
end
end
endtask

initial 
begin
reset();
write();
read();
end

initial
begin
#500;
$finish;
end

endmodule


 
