module bit12_counter(in1,sum);
	input [11:0] in1;
	wire [11:0]in2;
	output [11:0] sum;
	wire [10:0] nIn;
	assign in2=12'b000000000001;

	// full_adder(a,b,cin, sum, cout);
	full_adder full1(in1[0],in2[0],0, sum[0], nIn[0]);
	genvar j;
	generate
		for (j = 1; j<= 10; j = j + 1) begin:hi1
			full_adder fulli(in1[j],in2[j],nIn[j-1], sum[j], nIn[j]);
		end
	endgenerate
	full_adder full16(in1[11],in2[11],nIn[10], sum[11],);
endmodule
