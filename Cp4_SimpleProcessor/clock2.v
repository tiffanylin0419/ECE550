module clock2(clk,reset,clk2);

	input clk,reset;
	output reg clk2;
	
	always @(posedge clk)
		begin
			if (reset)
				clk2<=1'b0;
			else
				clk2<=~clk2;	
		end
		
		
	
	
endmodule