module scorer (GameOver, clk, rst, answer, HEX5, HEX4);
input clk, rst, GameOver;
input logic answer;
output [6:0] HEX5, HEX4;

logic[6:0] score = 7'd0;

sevenseg A(score/10, HEX5);
sevenseg B(score%10, HEX4);


always_ff@(posedge clk or negedge rst) begin
	if(!rst) 
	begin
		score <= 7'd0; 
	end
	else if (!GameOver)
	begin
		if(answer == 1 && score < 100) 
		begin
			score <= score + 1;
		end
		else begin
			score <= score;
		end	
	end
end

endmodule
