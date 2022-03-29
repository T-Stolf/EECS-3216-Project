`timescale 1ns/1ps
module tb;

	reg clk = 0;
	reg[3:0] in = 4'b0000;
	wire HSync, VSync;
	wire[3:0] R,G,B;
	
	top test(clk, in, HSync, VSync, R,G,B);
	
	always #5 clk = ~clk;
	
	always #1000 in[3:0] = ~in[3:0];
	
endmodule