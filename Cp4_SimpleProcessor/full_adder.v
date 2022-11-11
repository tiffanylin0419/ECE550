module full_adder(a,b,cin, sum, cout);
	input a,b,cin;
	output sum,cout;
	wire [2:0] nIn;
	xor xor1(nIn[0],a,b);
	xor xor2(sum,nIn[0],cin);
	and and3(nIn[1],nIn[0],cin);
	and and4(nIn[2],a,b);
	or or5(cout,nIn[1],nIn[2]);
endmodule
