//module debouncer(input pb_1,clk,output pb_out);
//wire slow_clk_en;
//wire Q1,Q2,Q2_bar,Q0;
//clock_enable u1(clk,slow_clk_en);
//my_dff_en d0(clk,slow_clk_en,pb_1,Q0);
//
//my_dff_en d1(clk,slow_clk_en,Q0,Q1);
//my_dff_en d2(clk,slow_clk_en,Q1,Q2);
//assign Q2_bar = ~Q2;
//assign pb_out = Q1 & Q2_bar;
//endmodule
//// Slow clock enable for debouncing button 
//module clock_enable(input Clk_100M,output slow_clk_en);
//    reg [26:0]counter=0;
//    always @(posedge Clk_100M)
//    begin
//       counter <= (counter>=249999)?0:counter+1;
//    end
//    assign slow_clk_en = (counter == 249999)?1'b1:1'b0;
//endmodule
//// D-flip-flop with clock enable signal for debouncing module 
//module my_dff_en(input DFF_CLOCK, clock_enable,D, output reg Q=0);
//    always @ (posedge DFF_CLOCK) begin
//  if(clock_enable==1) 
//           Q <= D;
//    end
//endmodule

`timescale 1 ns / 100 ps
module  debouncer
	(
	input 			clk, n_reset, button_in,				// inputs
	output reg 	DB_out													// output
	);
//// ---------------- internal constants --------------
	parameter N = 11 ;		// (2^ (21-1) )/ 38 MHz = 32 ms debounce time
////---------------- internal variables ---------------
	reg  [N-1 : 0]	q_reg;							// timing regs
	reg  [N-1 : 0]	q_next;
	reg DFF1, DFF2;									// input flip-flops
	wire q_add;											// control flags
	wire q_reset;
//// ------------------------------------------------------

////contenious assignment for counter control
	assign q_reset = (DFF1  ^ DFF2);		// xor input flip flops to look for level chage to reset counter
	assign  q_add = ~(q_reg[N-1]);			// add to counter when q_reg msb is equal to 0
	
//// combo counter to manage q_next	
	always @ ( q_reset, q_add, q_reg)
		begin
			case( {q_reset , q_add})
				2'b00 :
						q_next <= q_reg;
				2'b01 :
						q_next <= q_reg + 1;
				default :
						q_next <= { N {1'b0} };
			endcase 	
		end
	
//// Flip flop inputs and q_reg update
	always @ ( posedge clk )
		begin
			if(n_reset ==  1'b0)
				begin
					DFF1 <= 1'b0;
					DFF2 <= 1'b0;
					q_reg <= { N {1'b0} };
				end
			else
				begin
					DFF1 <= button_in;
					DFF2 <= DFF1;
					q_reg <= q_next;
				end
		end
	
//// counter control
	always @ ( posedge clk )
		begin
			if(q_reg[N-1] == 1'b1)
					DB_out <= DFF2;
			else
					DB_out <= DB_out;
		end

	endmodule

