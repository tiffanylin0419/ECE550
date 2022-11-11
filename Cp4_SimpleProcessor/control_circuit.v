module control_circuit(
	 input [4:0] opcode,
	output the_R, the_addi,the_sw,the_lw,the_beq,the_j,the_bne,the_blt,
	output DMwe,Rwe,Rwd,Rdst,ALUop,ALUinB,BNE,BLT//BR,JP,
);


	
	and and1(the_R,~opcode[4],~opcode[3],~opcode[2],~opcode[1],~opcode[0]);
	and and2(the_addi,~opcode[4],~opcode[3],opcode[2],~opcode[1],opcode[0]);
	and and3(the_sw,~opcode[4],~opcode[3],opcode[2],opcode[1],opcode[0]);
	and and4(the_lw,~opcode[4],opcode[3],~opcode[2],~opcode[1],~opcode[0]);
	assign the_beq=0;
	assign the_j=0;
	and and11(the_bne,~opcode[4],~opcode[3],~opcode[2],opcode[1],~opcode[0]);
	and and12(the_blt,~opcode[4],~opcode[3],opcode[2],opcode[1],~opcode[0]);
	
	and and5 (DMwe,the_sw,the_sw);
	or or6 (Rwe,the_R,the_addi,the_lw);
	and and7 (Rwd,the_lw,the_lw);
	and and8 (Rdst,the_R,the_R);
	and and9 (ALUop,the_beq,the_beq);
	or or10 (ALUinB,the_addi,the_sw,the_lw);
	assign BNE=the_bne;
	assign BLT=the_blt;
	
endmodule
