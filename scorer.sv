//module scorer (GameOver, clk, rst, answer, HEX5, HEX4);
//input clk, rst, GameOver;
//input logic answer;
//output [6:0] HEX5, HEX4;
//
//logic[6:0] score = 7'd0;
//
//sevenseg A(score/10, HEX5);
//sevenseg B(score%10, HEX4);
//
//
//logic test;
//debouncer Deb(clk, rst, answer, test);
//
//
//
//
//always_ff@(posedge clk or negedge rst) begin
//	if(!rst) 
//	begin
//		score <= 7'd0; 
//	end
//	else if (!GameOver)
//	begin
//		if(test == 1 && score < 100) 
//		begin
//			score <= score + 1;
//		end	
//	end
//end
//
//endmodule



//
//module scorer (GameOver, clk, rst, answer, HEX5, HEX4);
//input clk, rst, GameOver;
//input logic answer;
//output [6:0] HEX5, HEX4;
//
//reg answer_out;
//
//reg [6:0] score = 7'd0;
//reg clkslow;
//
//sevenseg A(score/10, HEX5);
//sevenseg B(score%10, HEX4);
//
//ClockDivider #(.D(32'd2)) CD(clk, clkslow);
//
//always_ff@(posedge clkslow or negedge rst) begin
//	if(!rst) 
//	begin
//		score = 7'd0; 
//	end
//	else if (!GameOver)
//	begin
//		if(answer > answer_out) begin
//			if(answer == 1 && score < 100) 
//			begin
//				answer_out = answer;
//				score = score + 1;
//			end
//		answer_out = answer;
//	end
//	answer_out = answer;
//end
//end
//
//endmodule



module scorer (GameOver, clk, rst, answer, HEX5, HEX4);
input clk, rst, GameOver;
input logic answer;
output [6:0] HEX5, HEX4;

reg answer_out = 0;

reg [6:0] score = 7'd0;

sevenseg A(score/10, HEX5);
sevenseg B(score%10, HEX4);

always_ff@(posedge answer or negedge rst) begin
	if(!rst) 
	begin
		score = 7'd0; 
	end
	else if (!GameOver)
	begin
		if(answer > answer_out) begin
			if(score < 100) 
			begin
				score <= score + 1;
			end
		answer_out <= 1;
	end
	answer_out <= 0;
end

end

endmodule



//module scorer (GameOver, clk, rst, answer, HEX5, HEX4);
//	input clk, rst, GameOver;
//	input logic answer;
//	output [6:0] HEX5, HEX4;
//	
//	logic[6:0] score = 7'd0, DigA, DigB;
//	
//	sevenseg A(score/10, DigA);
//	sevenseg B(score%10, DigB);
//
//	always_comb
//	begin
//		score = score + 1;	
//		HEX5 = DigA;
//		HEX4 = DigB;
//	end
//
//endmodule