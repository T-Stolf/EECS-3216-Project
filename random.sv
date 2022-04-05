module random
(
	input							sclk	,	// 50Mhz clock
	input							rst_n	,	// reset button, jut in case
	input							sw0,     // input, i use switch as an input to test it, when it push to 1, it will count input signal is high
	output		logic [2:0] matrix [0:3],
	output		logic [2:0] missing
	//below led only for test prupose
	//output		logic               led0,
	//output		logic               led1,
	//output		logic               led2,
	//output		logic               led3,
	//output		logic               led4
);

//logic sw0_pos;
//ax_debounce ax_debounce_m0
//(
//    .clk             (sclk),
//    .rst             (~rst_n),
//    .button_in       (sw0),
//    .button_posedge  (sw0_pos),
//    .button_negedge  (),
//    .button_out      ()
//);

logic [2:0] cnt;
always_ff@(posedge sclk or negedge rst_n)
begin
    if(rst_n == 1'b0)
    begin
        cnt <= 3'd0;
    end
    else if(cnt == 3'd4)
    begin
        cnt <= 3'd0;
    end
    else 
		cnt <= cnt + 1'd1;
end

logic [2:0] cnt1;
always_ff@(posedge sclk or negedge rst_n)
begin
    if(rst_n == 1'b0)
    begin
        cnt1 <= 3'd0;
    end
    else if(sw0 == 1)
    begin
        cnt1 <= cnt;
    end
end

logic               led0;
logic               led1;
logic               led2;
logic               led3;
logic               led4;
always_ff@(posedge sclk or negedge rst_n)
begin
    if(rst_n == 1'b0)
    begin
        matrix[0] <= 3'd0;
		matrix[1] <= 3'd0;
		matrix[2] <= 3'd0;
		matrix[3] <= 3'd0;
		led0 	  <= 1'd0;
		led1 	  <= 1'd0;
		led2 	  <= 1'd0;
		led3 	  <= 1'd0;
		led4 	  <= 1'd0;
    end
    else if(cnt1 == 3'd0)
    begin
        matrix[0] <= 3'b001;
		matrix[1] <= 3'b010;
		matrix[2] <= 3'b011;
		matrix[3] <= 3'b100;
		missing   <= 3'b000;
		led0 	  <= 1'd1;
		led1 	  <= 1'd0;
		led2 	  <= 1'd0;
		led3 	  <= 1'd0;
		led4 	  <= 1'd0;
    end
	else if(cnt1 == 3'd1)
    begin
        matrix[0] <= 3'b000;
		matrix[1] <= 3'b010;
		matrix[2] <= 3'b011;
		matrix[3] <= 3'b100;
		missing   <= 3'b001;
		led0 	  <= 1'd0;
		led1 	  <= 1'd1;
		led2 	  <= 1'd0;
		led3 	  <= 1'd0;
		led4 	  <= 1'd0;
    end
	else if(cnt1 == 3'd2)
    begin
        matrix[0] <= 3'b000;
		matrix[1] <= 3'b001;
		matrix[2] <= 3'b011;
		matrix[3] <= 3'b100;
		missing   <= 3'b010;
		led0 	  <= 1'd0;
		led1 	  <= 1'd0;
		led2 	  <= 1'd1;
		led3 	  <= 1'd0;
		led4 	  <= 1'd0;
    end
	else if(cnt1 == 3'd3)
    begin
        matrix[0] <= 3'b000;
		matrix[1] <= 3'b001;
		matrix[2] <= 3'b010;
		matrix[3] <= 3'b100;
		missing   <= 3'b001;
		led0 	  <= 1'd0;
		led1 	  <= 1'd0;
		led2 	  <= 1'd0;
		led3 	  <= 1'd1;
		led4 	  <= 1'd0;
    end
	else if(cnt1 == 3'd4)
    begin
        matrix[0] <= 3'b000;
		matrix[1] <= 3'b001;
		matrix[2] <= 3'b010;
		matrix[3] <= 3'b011;
		missing   <= 3'b100;
		led0 	  <= 1'd0;
		led1 	  <= 1'd0;
		led2 	  <= 1'd0;
		led3 	  <= 1'd0;
		led4 	  <= 1'd1;
    end
end

 

endmodule