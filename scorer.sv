module scorer (GameOver, clk, rst, answer, HEX5, HEX4);
input clk, rst, GameOver;
input logic answer;
output [6:0] HEX5, HEX4;

reg answer_out = 0;

reg [6:0] score = 7'b0000000;

reg[5:0] hold = 6'b0;
reg incremented = 1;

sevenseg A(score/10, HEX5);
sevenseg B(score%10, HEX4);

ClockDivider #(.D(32'd8)) CD (clk, slowclk);

logic slowclk;

always_ff@(posedge clk) begin
	if (!GameOver)
	begin
		if(incremented)
		begin
			hold <= 0;
		end
		else if(answer == 1 && score < 100) 
		begin
			hold <= hold + 1;
		end
		else
			hold<= hold;
	end
end

always_ff@(posedge slowclk or negedge rst) begin

	if(!rst) 
	begin
		score <= 7'd0; 
	end

	else 
	begin
		if(hold > 6'b0)
		begin
			score <= score + 1;
			incremented <= 1;
		end
		else
		begin
			incremented <= 0;
		end
	end

end


endmodule