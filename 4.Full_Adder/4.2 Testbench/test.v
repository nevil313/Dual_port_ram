//testbench
`timescale 1ns / 1ps


module tb;

reg a,b,cin;
wire sum,cout;
reg [1:0] golden[0:7];
integer i;
reg [2:0]error=0;
wire[1:0]test={sum,cout};

full dut(a,b,cin,sum,cout);

initial
 begin

	golden[0]=2'b00;
	golden[1]=2'b10;
	golden[2]=2'b10;
	golden[3]=2'b01;
	golden[4]=2'b10;
	golden[5]=2'b01;
	golden[6]=2'b01;
	golden[7]=2'b11;
	end
	
initial 
begin

	for(i=0;i<8;i=i+1)
         begin

		{a,b,cin}=i; 
$monitor("%b + %b + %b = %b,%b",a,b,cin,sum,cout);  
#1;

if(golden[i] != test)
begin
    error=error+1;
end
else
    error=error;
    $monitor("%b,%d",golden[i],error);

#10;
end

if(error==0)
    $display("test passe");
else
begin
    $monitor("test fail with %d mismatch",error);
end
end
endmodule

