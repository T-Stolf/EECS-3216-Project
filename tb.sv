`timescale 1ns/1ps
module tb;
//
//	reg clk = 0;
//	reg[3:0] in = 4'b0;
//	wire HSync, VSync;
//	wire[3:0] R,G,B;
//	
logic[15:0] vertMin = 35, vertMax = 514, horzMin = 143, horzMax = 783, rows = 13, columns = 5, vertInc, horzInc;
assign vertInc = (vertMax - vertMin) / rows;
assign horzInc = (horzMax - horzMin) / columns;
	//top test(clk, in, HSync, VSync, R,G,B);
	initial
	begin 
	$display("%b, %b", vertInc, horzInc);
	
	end
//	always #5 clk = ~clk;
//	
//	always #1000 in = ~in;
	
endmodule