
module top(Set,Reset,clk,clear,Qm,Qmb,Qs,Qsb);

input Set,Reset,clk,clear;
output Qm,Qmb,Qs,Qsb;

JK_Flip_Flop JK1(.J(Set),.K(Reset),.clk(clk),.reset(clear),.Q(Qm),.Qb(Qmb));

wire nclk;
not(nclk,clk);

JK_Flip_Flop JK2(.J(Qm),.K(Qmb),.clk(nclk),.reset(clear),.Q(Qs),.Qb(Qsb));
endmodule

module JK_Flip_Flop(J,K,clk,reset,Q,Qb);

input J,K,clk,reset;
output reg Q,Qb;

always@(posedge clk,posedge reset)
begin
if(reset)
   Q=1'b0;
   else
   begin
        if(J==1'b0&&K==1'b0)
            Q=Q;
        else if(J==1'b0&&K==1'b1)
            Q=1'b0;
        else if(J==1'b1&&K==1'b0)
            Q=1'b1;
        else 
            Q=~Q;
    end
   Qb<=~Q;
end

endmodule
