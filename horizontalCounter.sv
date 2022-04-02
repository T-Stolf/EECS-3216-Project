module horizontalCounter(input clk25MHz, output reg enableVertCount=0, output reg [15:0] horizontalCount=0);
	always@(posedge clk25MHz)
	begin
		if (horizontalCount < 799) 
		begin
			horizontalCount <= horizontalCount+1;
			enableVertCount <= 0; // disable vertical counter
		end
		else
		begin
			horizontalCount <= 0; // reset horizontal counter
			enableVertCount <= 1; // start the vertical counter
		end
	
	
	end

endmodule