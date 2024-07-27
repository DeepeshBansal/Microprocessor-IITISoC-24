`timescale 1ns/1ns

module Data_Mem(clk, Data_in, data_add, en_write, data_out);

    parameter MEM_WIDTH = 65534;

    input clk, en_write;
    input [31:0] data_add, Data_in;
    output reg [31:0] data_out;

    reg [31:0] Mem [MEM_WIDTH-1:0];

    integer i;

    initial begin
        // Initialize the memory with predefined values
        Mem[0] = 32'b00000000000000000000000001010101;
        Mem[1] = 32'b00000000000000000000000000101111;
        Mem[2] = 32'b00000000000000000000000111001110;
        Mem[3] = 32'b00000000000000000000001011100101;
        Mem[4] = 32'b00000000000000000000000000010100;
        Mem[5] = 32'b00000000000000000000000001001000;
        
        // Initialize the rest of the memory to 0
        for (i = 6; i < MEM_WIDTH; i = i + 1) begin
            Mem[i] = 32'b0;
        end
    end

    always @(negedge clk) begin
        if (en_write)
            Mem[data_add] <= Data_in;
        else
            data_out <= Mem[data_add];
    end

endmodule
