module Show_Colours(input[2:0] colourLocation [0:3], input CLOCK_50, GameOver, output VGA_HS, VGA_VS, output[0:3] VGA_R, VGA_G, VGA_B);


wire clk25MHz, enableVertCount, validArea ;
wire [15:0] verticalCount, horizontalCount;

ClockDivider #(.D(32'd1)) MHz25 (CLOCK_50, clk25MHz);
		
horizontalCounter VGAHoriz (clk25MHz, enableVertCount, horizontalCount);
verticalCounter VGAVert (clk25MHz, enableVertCount, verticalCount);

//outputs
//based on VGA standards
//https://www.youtube.com/watch?v=4enWoVHCykI
assign VGA_HS = (horizontalCount < 96) ? 1'b1:1'b0;
assign VGA_VS = (verticalCount < 2) ? 1'b1:1'b0;

//maximum assignable area
assign validArea = (horizontalCount < 784 && horizontalCount > 143 && verticalCount < 515 && verticalCount > 34) ? 1:0;

drawLines DL(GameOver, colourLocation, clk25MHz, validArea, horizontalCount, verticalCount, VGA_R, VGA_G, VGA_B);

endmodule
