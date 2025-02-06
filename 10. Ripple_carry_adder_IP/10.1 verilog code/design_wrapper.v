//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
//Date        : Fri Aug 23 19:09:22 2024
//Host        : NEVIL running 64-bit major release  (build 9200)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (ce,
    f,
    fi,
    q);
  input ce;
  input [3:0]f;
  output [4:0]fi;
  input [3:0]q;

  wire ce;
  wire [3:0]f;
  wire [4:0]fi;
  wire [3:0]q;

  design_1 design_1_i
       (.ce(ce),
        .f(f),
        .fi(fi),
        .q(q));
endmodule
