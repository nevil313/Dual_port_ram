module file_handaling(a,b,c);

input [3:0]a,b;
output [4:0]c;

assign c=a+b;

endmodule


module tb;
reg [3:0]a,b;
wire[4:0]c;

add dut(a,b,c);

integer file=0;
integer i=0;
reg [4:0]mem[45:0];

reg [4:0]t;
integer er=0;

initial
begin
file=$fopen("D:/Desktop/VRYLG/file_hand1/file_hand1.srcs/sim_1/imports/Desktop/nevi.txt","w");

for(i=0;i<15;i=i+1)
begin
$fdisplay(file,"%x\t %x\t %x",i,i,2*i);

end

$fclose(file);
file=$fopen("D:/Desktop/VRYLG/adder_with_file/adder_with_file.srcs/sim_1/imports/Desktop/nevs.txt","r");

$readmemh("D:/Desktop/VRYLG/adder_with_file/adder_with_file.srcs/sim_1/imports/Desktop/nevs.txt",mem);
#10;
for(i=0;i<15;i=i+1)
begin
a=mem[3*i];
b=mem[3*i +1];
t=mem[3*i +2];


#5;

if(t!=c)
er=er+1;
end

if(er==0)
$display("test pass");
else
$display("test fail");
end

endmodule
