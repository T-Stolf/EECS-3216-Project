

module drawLines(input[0:3] slice, input refreshclk, updateclk, areaValid, input[15:0] horizontal, vertical, output logic [0:3] R, G, B);

logic[11:0] white = 12'hFFF, black = 12'h0, blue = 12'h00F, red = 12'hF00, green = 12'h0F0, yellow = 12'hFF0, RGB;

parameter[15:0] vertMin = 35, vertMax = 514, horzMin = 143, horzMax = 783, rows = 13, columns = 50;
logic[15:0] vertInc, horzInc, j, k;

assign vertInc = (vertMax - vertMin) / rows;
assign horzInc = (horzMax - horzMin) / columns;

logic[0:columns-1][0:rows-1] area; //[0:4][0:3] area;

integer i, l;

always_ff@(posedge refreshclk)
begin
	if(areaValid)
	begin
		
		for(j = 0; j < rows; j = j + 1)
		begin
			for(k = 0; k < columns; k = k + 1)
			begin
			if(/*(area[0][0] || area[0][1] || area[0][2] || area[0][3])*/  area[k][j] == 1 && vertical >= (35 + vertInc) && vertical <= 514 && horizontal >= (143 + horzInc) && horizontal <= 783)
				RGB <= white;
			else if(area[k][j] == 0 && vertical >= (35 + vertInc) && vertical <= 514 && horizontal >= (143 + horzInc) && horizontal <= 783)
				RGB <= red;
			else
				RGB <= yellow;
			end
		end
	end
//		
//		else
//			{R, G, B} <= black;
	
//		for(j = 0; j < rows; j = j + 1)
//		begin
//			for(k = 0; k < columns; k = k + 1)
//			begin
//			if(/*(area[0][0] || area[0][1] || area[0][2] || area[0][3])*/  area[k][j] && vertical >= (35 /* + k * vertInc*/) && vertical <= 514 && horizontal >= (143 /*+ j * horzInc*/) && horizontal <= 783)
//				{R, G, B} <= white;
//			else 
//				{R, G, B} <= 12'hFF0;
//			end
//		end
//	end
	
//		//column 0
//		if(area[0][0] && (vertical > 34 && vertical < 154) && (horizontal > 143 && horizontal < 271))
//			{R, G, B} <= white;
//		else if(area[0][1] && (vertical > 154 && vertical < 274) && (horizontal > 143 && horizontal < 271))
//			{R, G, B} <= white;
//		else if(area[0][2] && (vertical > 274 && vertical < 394) && (horizontal > 143 && horizontal < 271))
//			{R, G, B} <= white;
//		else if(area[0][3] && (vertical > 394 && vertical < 515) && (horizontal > 143 && horizontal < 271))
//			{R, G, B} <= white;
//		//column 1	
//		else if(area[1][0] && (vertical > 34 && vertical < 154) && (horizontal > 271 && horizontal < 399))
//			{R, G, B} <= white;
//		else if(area[1][1] && (vertical > 154 && vertical < 274) && (horizontal > 271 && horizontal < 399))
//			{R, G, B} <= white;
//		else if(area[1][2] && (vertical > 274 && vertical < 394) && (horizontal > 271 && horizontal < 399))
//			{R, G, B} <= white;
//		else if(area[1][3] && (vertical > 394 && vertical < 515) && (horizontal > 271 && horizontal < 399))
//			{R, G, B} <= white;
//		//column 2	
//		else if(area[2][0] && (vertical > 34 && vertical < 154) && (horizontal > 399 && horizontal < 527))
//			{R, G, B} <= white;
//		else if(area[2][1] && (vertical > 154 && vertical < 274) && (horizontal > 399 && horizontal < 527))
//			{R, G, B} <= white;
//		else if(area[2][2] && (vertical > 274 && vertical < 394) && (horizontal > 399 && horizontal < 527))
//			{R, G, B} <= white;
//		else if(area[2][3] && (vertical > 394 && vertical < 515) && (horizontal > 399 && horizontal < 527))
//			{R, G, B} <= white;
//		//column 3	
//		else if(area[3][0] && (vertical > 34 && vertical < 154) && (horizontal > 527 && horizontal < 655))
//			{R, G, B} <= white;
//		else if(area[3][1] && (vertical > 154 && vertical < 274) && (horizontal > 527 && horizontal < 655))
//			{R, G, B} <= white;
//		else if(area[3][2] && (vertical > 274 && vertical < 394) && (horizontal > 527 && horizontal < 655))
//			{R, G, B} <= white;
//		else if(area[3][3] && (vertical > 394 && vertical < 515) && (horizontal > 527 && horizontal < 655))
//			{R, G, B} <= white;
//		//column 4	
//		else if(area[4][0] && (vertical > 34 && vertical < 154) && (horizontal > 655 && horizontal < 783))
//			{R, G, B} <= white;
//		else if(area[4][1] && (vertical > 154 && vertical < 274) && (horizontal > 655 && horizontal < 783))
//			{R, G, B} <= white;
//		else if(area[4][2] && (vertical > 274 && vertical < 394) && (horizontal > 655 && horizontal < 783))
//			{R, G, B} <= white;
//		else if(area[4][3] && (vertical > 394 && vertical < 515) && (horizontal > 655 && horizontal < 783))
//			{R, G, B} <= white;

//		//column 0
//		if(area[0][0] && (vertical > 34 && vertical < 154) && (horizontal > 143 && horizontal < 207))
//			{R, G, B} <= white;
//		else if(area[0][1] && (vertical > 154 && vertical < 274) && (horizontal > 143 && horizontal < 207))
//			{R, G, B} <= white;
//		else if(area[0][2] && (vertical > 274 && vertical < 394) && (horizontal > 143 && horizontal < 207))
//			{R, G, B} <= white;
//		else if(area[0][3] && (vertical > 394 && vertical < 515) && (horizontal > 143 && horizontal < 207))
//			{R, G, B} <= white;
//		//column 1	
//		else if(area[1][0] && (vertical > 34 && vertical < 154) && (horizontal > 207 && horizontal < 271))
//			{R, G, B} <= white;
//		else if(area[1][1] && (vertical > 154 && vertical < 274) && (horizontal > 207 && horizontal < 271))
//			{R, G, B} <= white;
//		else if(area[1][2] && (vertical > 274 && vertical < 394) && (horizontal > 207 && horizontal < 271))
//			{R, G, B} <= white;
//		else if(area[1][3] && (vertical > 394 && vertical < 515) && (horizontal > 207 && horizontal < 271))
//			{R, G, B} <= white;
//		//column 2	
//		else if(area[2][0] && (vertical > 34 && vertical < 154) && (horizontal > 271 && horizontal < 335))
//			{R, G, B} <= white;
//		else if(area[2][1] && (vertical > 154 && vertical < 274) && (horizontal > 271 && horizontal < 335))
//			{R, G, B} <= white;
//		else if(area[2][2] && (vertical > 274 && vertical < 394) && (horizontal > 271 && horizontal < 335))
//			{R, G, B} <= white;
//		else if(area[2][3] && (vertical > 394 && vertical < 515) && (horizontal > 271 && horizontal < 335))
//			{R, G, B} <= white;
//		//column 3	
//		else if(area[3][0] && (vertical > 34 && vertical < 154) && (horizontal > 335 && horizontal < 399))
//			{R, G, B} <= white;
//		else if(area[3][1] && (vertical > 154 && vertical < 274) && (horizontal > 335 && horizontal < 399))
//			{R, G, B} <= white;
//		else if(area[3][2] && (vertical > 274 && vertical < 394) && (horizontal > 335 && horizontal < 399))
//			{R, G, B} <= white;
//		else if(area[3][3] && (vertical > 394 && vertical < 515) && (horizontal > 335 && horizontal < 399))
//			{R, G, B} <= white;
//		//column 4	
//		else if(area[4][0] && (vertical > 34 && vertical < 154) && (horizontal > 399 && horizontal < 463))
//			{R, G, B} <= white;
//		else if(area[4][1] && (vertical > 154 && vertical < 274) && (horizontal > 399 && horizontal < 463))
//			{R, G, B} <= white;
//		else if(area[4][2] && (vertical > 274 && vertical < 394) && (horizontal > 399 && horizontal < 463))
//			{R, G, B} <= white;
//		else if(area[4][3] && (vertical > 394 && vertical < 515) && (horizontal > 399 && horizontal < 463))
//			{R, G, B} <= white;
//		//column 5
//		else if(area[5][0] && (vertical > 34 && vertical < 154) && (horizontal > 463 && horizontal < 528))
//			{R, G, B} <= white;
//		else if(area[5][1] && (vertical > 154 && vertical < 274) && (horizontal > 463 && horizontal < 528))
//			{R, G, B} <= white;
//		else if(area[5][2] && (vertical > 274 && vertical < 394) && (horizontal > 463 && horizontal < 528))
//			{R, G, B} <= white;
//		else if(area[5][3] && (vertical > 394 && vertical < 515) && (horizontal > 463 && horizontal < 528))
//			{R, G, B} <= white;
//		//column 6	
//		else if(area[6][0] && (vertical > 34 && vertical < 154) && (horizontal > 528 && horizontal < 592))
//			{R, G, B} <= white;
//		else if(area[6][1] && (vertical > 154 && vertical < 274) && (horizontal > 528 && horizontal < 592))
//			{R, G, B} <= white;
//		else if(area[6][2] && (vertical > 274 && vertical < 394) && (horizontal > 528 && horizontal < 592))
//			{R, G, B} <= white;
//		else if(area[6][3] && (vertical > 394 && vertical < 515) && (horizontal > 528 && horizontal < 592))
//			{R, G, B} <= white;
//		//column 7	
//		else if(area[7][0] && (vertical > 34 && vertical < 154) && (horizontal > 592 && horizontal < 656))
//			{R, G, B} <= white;
//		else if(area[7][1] && (vertical > 154 && vertical < 274) && (horizontal > 592 && horizontal < 656))
//			{R, G, B} <= white;
//		else if(area[7][2] && (vertical > 274 && vertical < 394) && (horizontal > 592 && horizontal < 656))
//			{R, G, B} <= white;
//		else if(area[7][3] && (vertical > 394 && vertical < 515) && (horizontal > 592 && horizontal < 656))
//			{R, G, B} <= white;
//		//column 8	
//		else if(area[8][0] && (vertical > 34 && vertical < 154) && (horizontal > 656 && horizontal < 720))
//			{R, G, B} <= white;
//		else if(area[8][1] && (vertical > 154 && vertical < 274) && (horizontal > 656 && horizontal < 720))
//			{R, G, B} <= white;
//		else if(area[8][2] && (vertical > 274 && vertical < 394) && (horizontal > 656 && horizontal < 720))
//			{R, G, B} <= white;
//		else if(area[8][3] && (vertical > 394 && vertical < 515) && (horizontal > 656 && horizontal < 720))
//			{R, G, B} <= white;
//		//column 9	
//		else if(area[9][0] && (vertical > 34 && vertical < 154) && (horizontal > 720 && horizontal < 783))
//			{R, G, B} <= white;
//		else if(area[9][1] && (vertical > 154 && vertical < 274) && (horizontal > 720 && horizontal < 783))
//			{R, G, B} <= white;
//		else if(area[9][2] && (vertical > 274 && vertical < 394) && (horizontal > 720 && horizontal < 783))
//			{R, G, B} <= white;
//		else if(area[9][3] && (vertical > 394 && vertical < 515) && (horizontal > 720 && horizontal < 783))
//			{R, G, B} <= white;	
		

		
		else
			RGB <= black;
end




always_ff@(posedge updateclk)
begin
	for(i = 0; i < rows; i = i + 1)
		begin
			if(i <= 3)
				area[0][i] <= slice[i];
			else
				area[0][i] <= 0;
			
			for(l = 1; l < columns; l = l + 1)
			begin
				area[l][i] <= area[l-1][i];
			end
		end
//	area[0][0] <= slice[0];
//	area[0][1] <= slice[1];
//	area[0][2] <= slice[2];
//	area[0][3] <= slice[3];
//	for(i = 1; i < 5; i = i + 1)
//	begin
//		area[i][0] <= area[i-1][0];
//		area[i][1] <= area[i-1][1];
//		area[i][2] <= area[i-1][2];
//		area[i][3] <= area[i-1][3];
//	end
end


always_comb
begin
	R[0:3] <= RGB[11:8];
	G[0:3] <= RGB[7:4];
	B[0:3] <= RGB[3:0];
end

endmodule