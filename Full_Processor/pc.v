module pc(clock, reset, in, out);
	input clock,reset;
	input [11:0]in;
	output [11:0]out;
	
	//register(Q, D, clk, en, clr);
	register r1(out,in,clock,1,reset);

endmodule 