`timescale 1ns/1ns

module Control_Hazard_Unit(
    input [4:0] Rs_D, Rt_D, Rt_E,
    input MemtoReg_E, Reg_Write_E, Write_Reg_E,
    input Reg_Write_M, Write_Reg_M,
    input Branch_D, MemtoReg_M,
    output reg Stall_F, Stall_D, Flush_E
);

    reg lwstall, branchstall;

    initial
    begin
        Stall_F = 1'b1;
        Stall_D = 1'b1;
        Flush_E = 1'b1;
    end

    // Hazard Stall unit
    always @(*)
    begin
        lwstall = ((Rs_D == Rt_E) || (Rt_D == Rt_E)) && MemtoReg_E;

        branchstall = Branch_D & (Reg_Write_E & ((Write_Reg_E == Rs_D) | (Write_Reg_E == Rt_D)) |
                        MemtoReg_M & ((Write_Reg_M == Rs_D) | (Write_Reg_M == Rt_D)));

        Stall_F = lwstall || branchstall;
        Stall_D = lwstall || branchstall;
        Flush_E = lwstall || branchstall;
    end

endmodule
