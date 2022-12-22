module math(
	 opcode,aluop,
	 the_add,the_sub,the_addi
);
	input [4:0] opcode,aluop;
	output the_add,the_sub,the_addi;
	
	and a1(the_add,~opcode[4],~opcode[3],~opcode[2],~opcode[1],~opcode[0],~aluop[4],~aluop[3],~aluop[2],~aluop[1],~aluop[0]);
	and a2(the_sub,~opcode[4],~opcode[3],~opcode[2],~opcode[1],~opcode[0],~aluop[4],~aluop[3],~aluop[2],~aluop[1],aluop[0]);
	and a3(the_addi,~opcode[4],~opcode[3],opcode[2],~opcode[1],opcode[0]);
	
endmodule
