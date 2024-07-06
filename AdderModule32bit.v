`timescale 1ns / 1ps

module AdderModule32bit(
	input [31:0]A,
	input [31:0]B,
	
	output [31:0]result
    );

	assign result = A + B;

endmodule
