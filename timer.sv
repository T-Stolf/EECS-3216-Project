module timer(clk,rst,hex0,hex1, game_over_signal);

	input clk,rst;
	output [6:0] hex0;
	output [6:0] hex1;
	output reg game_over_signal = 0;
	
	reg [3:0] first_dig = 4'd0;
	reg [3:0] second_dig = 4'd6;

	reg cnt_dn = 1'b0;
	reg blink = 1'b1;
	
	seg7(first_dig,blink,hex0);
	seg7(second_dig,blink,hex1);
	
	wire cout;
	ClockDivider(clk,cout);
	
	always @(posedge cout or negedge rst) begin

			if(rst == 1'b0) begin
					first_dig <= 4'd0;
					second_dig <= 4'd6;
					cnt_dn <= 1'b0;
					game_over_signal <= 0;
			end else begin


					if(first_dig > 4'b0000 || second_dig > 4'b0000) begin			//counting down
							cnt_dn <= ~cnt_dn; 
							if(second_dig == 4'b0000) begin
									blink <= ~blink;
							end		
							if (cnt_dn == 1'b1) begin
																
									if(second_dig != 4'b0000 || first_dig != 4'b0000) begin
											if (first_dig == 4'b0000) begin
													second_dig <= second_dig - 4'b0001;
													first_dig  <= 4'b1001;//9
											end
											else begin
													first_dig <= first_dig - 4'b0001;
											end
									end

							end 

					end
					else begin
							game_over_signal <= 1;
					end

			end
	end
	
endmodule
