module verticalCounter(input clk25MHz, input enableVertCount, output reg [15:0] verticalCount=0);
	always@(posedge clk25MHz)
	begin
		if(enableVertCount == 1'b1)
		begin
			if (verticalCount < 524 && enableVertCount == 1'b1) 
			begin
				verticalCount <= verticalCount+1;
			end
			else
			begin
				verticalCount <= 0;//reset horizontal counter
			end
		end
	
	end

endmodule