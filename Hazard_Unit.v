`timescale 1ns/1ns

`include "Control_Hazard.v"
`include "Data_Hazard.v"

module Hazard_Unit(
    input [4:0] Rs_D, Rt_D, Rs_E, Rt_E, Write_Reg_E, Write_Reg_M,
    input Reg_Write_E, Reg_Write_M, MemtoReg_E, Reg_Write_W,
    input Branch_D, MemtoReg_M,
    output Stall_F, Flush_E, Stall_D,
    output [1:0] Forward_AE, Forward_BE,
    output Forward_AD, Forward_BD
);

    Data_Hazard_Unit data_hazard(
        .Rs_D(Rs_D),
        .Rt_D(Rt_D),
        .Rs_E(Rs_E),
        .Rt_E(Rt_E),
        .Write_Reg_E(Write_Reg_E),
        .Write_Reg_M(Write_Reg_M),
        .Reg_Write_E(Reg_Write_E),
        .Reg_Write_M(Reg_Write_M),
        .Reg_Write_W(Reg_Write_W),
        .Forward_AE(Forward_AE),
        .Forward_BE(Forward_BE),
        .Forward_AD(Forward_AD),
        .Forward_BD(Forward_BD)
    );

    Control_Hazard_Unit control_hazard(
        .Rs_D(Rs_D),
        .Rt_D(Rt_D),
        .Rt_E(Rt_E),
        .MemtoReg_E(MemtoReg_E),
        .Reg_Write_E(Reg_Write_E),
        .Write_Reg_E(Write_Reg_E),
        .Reg_Write_M(Reg_Write_M),
        .Write_Reg_M(Write_Reg_M),
        .Branch_D(Branch_D),
        .MemtoReg_M(MemtoReg_M),
        .Stall_F(Stall_F),
        .Stall_D(Stall_D),
        .Flush_E(Flush_E)
    );

endmodule
