module register(Q, D, clk, en, clr);

   //Inputs
   input [11:0]D;
	input clk, en, clr;
   
   //Internal wire
   wire clr;

   //Output
   output [11:0]Q;

   /* YOUR CODE HERE */
	
	genvar i;
	generate
		for (i = 0; i<= 11; i = i + 1) begin:hi0
			dffe_ref d(Q[i], D[i], clk, en, clr);
		end
	endgenerate
	
endmodule
