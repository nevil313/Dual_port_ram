`timescale 1ns/1ps

module test;

reg [7:0]data_a,data_b;
reg [3:0]add_a,add_b;
wire [7:0]out_a,out_b;
reg clk=0,rst,we_a,we_b,re_a,re_b;
integer i;

dual_port dut(clk,rst,we_a,we_b,re_a,re_b,data_a,data_b,add_a,add_b,out_a,out_b);


task reset;
begin
rst = 1;
we_a=0;
we_b=0;
re_a=0;
re_b=0;
data_a=0;
data_b=0;
add_a=0;
add_b=0;
repeat(5) @(posedge clk);
end
endtask


always #20 clk=~clk;

task write_a;
begin
we_a=1;
re_a=0;
rst=0;
//@(posedge clk)
@(posedge clk)
for(i=0;i<20;i=i+1)
    begin
    data_a=$urandom();
    add_a=$urandom_range(1,15);
    @(posedge clk);
    end
end
endtask


task write_b;
begin

we_b=1;
re_b=0;
rst=0;
@(posedge clk)
for(i=0;i<20;i=i+1)
    begin
    data_b=$urandom();
    add_b=$urandom_range(1,15);
    @(posedge clk);
    end
end
endtask


task read_a;
begin
we_a=0;
re_a=1;
rst=0;
@(posedge clk)
for(i=0;i<20;i=i+1)
    begin
    add_a=$urandom_range(1,15);
    @(posedge clk);
    end
end
endtask


task read_b;
begin

we_b=0;
re_b=1;
rst=0;
@(posedge clk)
for(i=0;i<20;i=i+1)
    begin
    add_b=$urandom_range(1,15);
    @(posedge clk);
    end
end
endtask

initial 
begin
reset();
write_a();
write_b();
read_a();
read_b();
end

initial
begin
#500;
$finish;
end

endmodule
