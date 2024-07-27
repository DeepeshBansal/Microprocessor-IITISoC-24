`timescale 1ns/1ns

module Instruction_Memory(inst_add, inst);

    input wire [31:0] inst_add;
    output wire [31:0] inst;

    reg [31:0] mem [255:0];
    integer i;  // Declare the integer variable outside the initial block

    initial begin
        // Initialize the memory with predefined values
        mem[0] = 32'b10001100000000110000000000000011;
        mem[1] = 32'b10001100000001000000000000000100;
        mem[2] = 32'b10001100000001010000000000000101;
        mem[3] = 32'b10001100000001100000000000000010;
        mem[4] = 32'b00000000110001010101000000000000;
        mem[5] = 32'b00000000100000110101100000000001;
        mem[6] = 32'b111111zzzzzzzzzzzzzzzzzzzzzzzzzz;
        
        // Initialize the rest of the memory to 0
        for (i = 7; i < 256; i = i + 1) begin
            mem[i] = 32'b0;
        end
    end

    assign inst = mem[inst_add[7:0]];

endmodule
