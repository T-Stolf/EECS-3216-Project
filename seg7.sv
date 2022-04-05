module seg7(in,en,out);
	input en;
	input [3:0] in;
	output [6:0] out;

			assign out[0] = en ? (~in[3] & ~in[2] & ~in[1] & in[0]) | (~in[3] & in[2] & ~in[1] & ~in[0]) | (in[3] & ~in[2] & in[1] & in[0]) | (in[3] & in[2] & ~in[1] & in[0]) : 1'b1;
			assign out[1] =  en ? (~in[3] & in[2] & ~in[1] & in[0]) | (~in[3] & in[2] & in[1] & ~in[0]) | (in[3] & ~in[2] & in[1] & in[0]) | (in[3] & in[2] & ~in[1] & ~in[0]) | (in[3] & in[2] & in[1] & ~in[0]) | (in[3] & in[2] & in[1] & in[0]): 1'b1;
			assign out[2] =  en ? (~in[3] & ~in[2] & in[1] & ~in[0]) | (in[3] & in[2] & ~in[1] & ~in[0]) | (in[3] & in[2] & in[1] & ~in[0]) | (in[3] & in[2] & in[1] & in[0]): 1'b1;
			assign out[3] =  en ? (~in[3] & ~in[2] & ~in[1] & in[0]) | (~in[3] & in[2] & ~in[1] & ~in[0]) | (~in[3] & in[2] & in[1] & in[0]) | (in[3] & ~in[2] & in[1] & ~in[0]) | (in[2] & in[2] & in[1] & in[0]): 1'b1;
			assign out[4] =  en ? (~in[3] & ~in[2] & ~in[1] & in[0]) | (~in[3] & ~in[2] & in[1] & in[0]) | (~in[3] & in[2] & ~in[1] & ~in[0]) | (~in[3] & in[2] & ~in[1] & in[0]) | (~in[3] & in[2] & in[1] & in[0]) | (in[3] & ~in[2] & ~in[1] & in[0]): 1'b1;
			assign out[5] =  en ? (~in[3] & ~in[2] & ~in[1] & in[0]) | (~in[3] & ~in[2] & in[1] & ~in[0]) | (~in[3] & ~in[2] & in[1] & in[0]) | (~in[3] & in[2] & in[1] & in[0]) | (in[3] & in[2] & ~in[1] & in[0]): 1'b1;
			assign out[6] =  en ? (~in[3] & ~in[2] & ~in[1] & ~in[0]) | (~in[3] & ~in[2] & ~in[1] & in[0]) | (~in[3] & in[2] & in[1] & in[0]) | (in[3] & in[2] & ~in[1] & ~in[0]): 1'b1;
	
	
endmodule 