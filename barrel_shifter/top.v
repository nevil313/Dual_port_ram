module top(q,sel,shifted_q);

input [3:0]q;
input [1:0]sel;
output reg [3:0]shifted_q;


always@(*)
begin
if(sel==2'd0)
    shifted_q[3:0] =q;
else if(sel==2'd1)
    shifted_q[3:0] ={q[0],q[3:1]};
else if(sel==2'd2)
    shifted_q[3:0] = {q[1],q[0],q[3:2]};
else if(sel==2'd3)
    shifted_q[3:0] ={q[2],q[1],q[0],q[3]};
else
     begin
    shifted_q=q;    
    end
end

assign q =shifted_q;
endmodule
