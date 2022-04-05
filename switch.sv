module switch(GameOver, clk, s0, s1, s2, s3, s4, submit_button, ans, correct_signal);

input s0, s1, s2, s3, s4, submit_button, clk, GameOver;
input logic[2:0] ans;
output logic correct_signal = 0;

		always@(posedge clk or negedge submit_button)
		begin
				if(!submit_button)
				begin
						if(ans == 3'b000 && GameOver == 0)
						begin
											if(s0==1 && s1==0 && s2==0 && s3==0 && s4==0)
													correct_signal <= 1;
											else 
													correct_signal<= 0;
						end
						if(ans == 3'b001 && GameOver == 0)
						begin
											if(s0==0 && s1==1 && s2==0 && s3==0 && s4==0)
													correct_signal <= 1;
											else 
													correct_signal<= 0;
						end
						if(ans == 3'b010 && GameOver == 0)
						begin
											if(s0==0 && s1==0 && s2==1 && s3==0 && s4==0)
													correct_signal <= 1;
											else 
													correct_signal<= 0;
						end
						if(ans == 3'b011 && GameOver == 0)
						begin
										if(s0==0 && s1==0 && s2==0 && s3==1 && s4==0)
												correct_signal <= 1;
										else 
												correct_signal<= 0;
						end
						if(ans == 3'b100 && GameOver == 0)
						begin
										if(s0==0 && s1==0 && s2==0 && s3==0 && s4==1)
												correct_signal <= 1;
									else
												correct_signal<= 0;
						end		
				end
				
			else 
				correct_signal<= 0;
		end
endmodule

