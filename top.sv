module top(input CLOCK_50, input[0:1] KEY, input[0:5] SW, output[0:9]LEDR, output[6:0] HEX0, HEX1, HEX4, HEX5, output VGA_HS, VGA_VS, output[0:3] VGA_R, VGA_G, VGA_B);

logic[2:0] displayColours [0:3];
logic[2:0] answerColour;
logic gameOverSignal, correctAnswerSignal;

logic slowclock;

random Rand(CLOCK_50, KEY[0], correctAnswerSignal, displayColours, answerColour);

timer Time(CLOCK_50, KEY[0], HEX0, HEX1, gameOverSignal);

scorer Score(gameOverSignal, CLOCK_50, KEY[0], correctAnswerSignal, HEX5, HEX4);

switch Switches(gameOverSignal, CLOCK_50, SW[0], SW[1], SW[2], SW[3], SW[4], KEY[1], answerColour, correctAnswerSignal);

Show_Colours VGA(displayColours, CLOCK_50, gameOverSignal, VGA_HS, VGA_VS, VGA_R, VGA_G, VGA_B);

 
assign LEDR[0:4] = SW[0:4];
//assign LEDR[8:9] = KEY[0:1];
assign LEDR[6] = correctAnswerSignal;
 
endmodule