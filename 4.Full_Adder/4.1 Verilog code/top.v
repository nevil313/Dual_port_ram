module top(a,b,carry,sum,cout);
input a,b,carry;
output sum,cout;
wire e,u,r;
x_or a1(a,b,e);
x_or a2(e,carry,sum);
a_nd a3(e,carry,u);
a_nd a4(a,carry,r);
o_r a5(u,r,cout);
endmodule

module x_or(x,y,z);
input x,y;
output z;
assign z= x^y;
endmodule

module a_nd(s,d,g);
input s,d;
output g;
assign g= s&d;
endmodule

module o_r(h,j,k);
input h,j;
output k;
assign k=h | j;
endmodule
