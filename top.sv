//`timescale 1ns/1ps
// 
module top(input CLOCK_50, input[0:3] SW ,output VGA_HS, VGA_VS, output[0:3] VGA_R, VGA_G, VGA_B);//(input clk, output HSync, output VSync, output[3:0] R,G,B);


wire clk25MHz, halfSecondclk, enableVertCount, validArea ;
wire [15:0] verticalCount, horizontalCount;

ClockDivider #(.D(32'd1)) MHz25 (CLOCK_50, clk25MHz);
		
ClockDivider halfSec(CLOCK_50, halfSecondclk);
		
horizontalClock VGAHoriz (clk25MHz, enableVertCount, horizontalCount);
verticalClock VGAVert (clk25MHz, enableVertCount, verticalCount);

//outputs
//based on VGA standards
//https://www.youtube.com/watch?v=4enWoVHCykI
assign VGA_HS = (horizontalCount < 96) ? 1'b1:1'b0;
assign VGA_VS = (verticalCount < 2) ? 1'b1:1'b0;

//maximum assignable area
assign validArea = (horizontalCount < 784 && horizontalCount > 143 && verticalCount < 515 && verticalCount > 34) ? 1:0;

drawLines DL(SW, clk25MHz, halfSecondclk, validArea, horizontalCount, verticalCount, VGA_R, VGA_G, VGA_B);
//assign VGA_R = smallerArea ? 4'hF:4'h0;
//assign VGA_G = smallerArea ? 4'hF:4'h0;
//assign VGA_B = smallerArea ? 4'hF:4'h0;




endmodule
