module drawLines(input[0:3] slice, input refreshclk, updateclk, areaValid, input[15:0] horizontal, vertical, output [0:3] R, G, B);

logic[11:0] white = 12'hFFF, black = 12'h0, blue = 12'h00F, red = 12'hF00, green = 12'h0F0;

logic[0:4][0:3] area;

logic vertMin = 35, vertMax = 514, horzMin = 143, horzMax = 783, rows = 13, columns = 50, vertInc, horzInc;
assign vertInc = (vertMax - vertMin) / rows;
assign horzInc = (horzMax - horzMin) / columns;

integer i, j, k;

always_ff@(posedge refreshclk)
begin
	if(areaValid)
	begin
		for(j = 1; j < rows; j = j + 1)
		begin
			for(k = 0; k < columns; k = k + 1)
			begin
			if(area
			
			end
		end
	
	
		//column 0
		if(area[0][0] && (vertical > 34 && vertical < 154) && (horizontal > 143 && horizontal < 271))
			{R, G, B} <= white;
		else if(area[0][1] && (vertical > 154 && vertical < 274) && (horizontal > 143 && horizontal < 271))
			{R, G, B} <= white;
		else if(area[0][2] && (vertical > 274 && vertical < 394) && (horizontal > 143 && horizontal < 271))
			{R, G, B} <= white;
		else if(area[0][3] && (vertical > 394 && vertical < 515) && (horizontal > 143 && horizontal < 271))
			{R, G, B} <= white;
		//column 1	
		else if(area[1][0] && (vertical > 34 && vertical < 154) && (horizontal > 271 && horizontal < 399))
			{R, G, B} <= white;
		else if(area[1][1] && (vertical > 154 && vertical < 274) && (horizontal > 271 && horizontal < 399))
			{R, G, B} <= white;
		else if(area[1][2] && (vertical > 274 && vertical < 394) && (horizontal > 271 && horizontal < 399))
			{R, G, B} <= white;
		else if(area[1][3] && (vertical > 394 && vertical < 515) && (horizontal > 271 && horizontal < 399))
			{R, G, B} <= white;
		//column 2	
		else if(area[2][0] && (vertical > 34 && vertical < 154) && (horizontal > 399 && horizontal < 527))
			{R, G, B} <= white;
		else if(area[2][1] && (vertical > 154 && vertical < 274) && (horizontal > 399 && horizontal < 527))
			{R, G, B} <= white;
		else if(area[2][2] && (vertical > 274 && vertical < 394) && (horizontal > 399 && horizontal < 527))
			{R, G, B} <= white;
		else if(area[2][3] && (vertical > 394 && vertical < 515) && (horizontal > 399 && horizontal < 527))
			{R, G, B} <= white;
		//column 3	
		else if(area[3][0] && (vertical > 34 && vertical < 154) && (horizontal > 527 && horizontal < 655))
			{R, G, B} <= white;
		else if(area[3][1] && (vertical > 154 && vertical < 274) && (horizontal > 527 && horizontal < 655))
			{R, G, B} <= white;
		else if(area[3][2] && (vertical > 274 && vertical < 394) && (horizontal > 527 && horizontal < 655))
			{R, G, B} <= white;
		else if(area[3][3] && (vertical > 394 && vertical < 515) && (horizontal > 527 && horizontal < 655))
			{R, G, B} <= white;
		//column 4	
		else if(area[4][0] && (vertical > 34 && vertical < 154) && (horizontal > 655 && horizontal < 783))
			{R, G, B} <= white;
		else if(area[4][1] && (vertical > 154 && vertical < 274) && (horizontal > 655 && horizontal < 783))
			{R, G, B} <= white;
		else if(area[4][2] && (vertical > 274 && vertical < 394) && (horizontal > 655 && horizontal < 783))
			{R, G, B} <= white;
		else if(area[4][3] && (vertical > 394 && vertical < 515) && (horizontal > 655 && horizontal < 783))
			{R, G, B} <= white;
			
			
			
		else
			{R, G, B} <= black;
	end	
end




always_ff@(posedge updateclk)
begin
	area[0][0] <= slice[0];
	area[0][1] <= slice[1];
	area[0][2] <= slice[2];
	area[0][3] <= slice[3];
	for(i = 1; i < 5; i = i + 1)
	begin
		area[i][0] <= area[i-1][0];
		area[i][1] <= area[i-1][1];
		area[i][2] <= area[i-1][2];
		area[i][3] <= area[i-1][3];
	end
end

endmodule