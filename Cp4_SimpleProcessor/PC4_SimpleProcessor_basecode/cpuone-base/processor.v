/**
 * READ THIS DESCRIPTION!
 *
 * The processor takes in several inputs from a skeleton file.
 *
 * Inputs
 * clock: this is the clock for your processor at 50 MHz
 * reset: we should be able to assert a reset to start your pc from 0 (sync or
 * async is fine)
 *
 * Imem: input data from imem
 * Dmem: input data from dmem
 * Regfile: input data from regfile
 *
 * Outputs
 * Imem: output control signals to interface with imem
 * Dmem: output control signals and data to interface with dmem
 * Regfile: output control signals and data to interface with regfile
 *
 * Notes
 *
 * Ultimately, your processor will be tested by subsituting a master skeleton, imem, dmem, so the
 * testbench can see which controls signal you active when. Therefore, there needs to be a way to
 * "inject" imem, dmem, and regfile interfaces from some external controller module. The skeleton
 * file acts as a small wrapper around your processor for this purpose.
 *
 * You will need to figure out how to instantiate two memory elements, called
 * "syncram," in Quartus: one for imem and one for dmem. Each should take in a
 * 12-bit address and allow for storing a 32-bit value at each address. Each
 * should have a single clock.
 *
 * Each memory element should have a corresponding .mif file that initializes
 * the memory element to certain value on start up. These should be named
 * imem.mif and dmem.mif respectively.
 *
 * Importantly, these .mif files should be placed at the top level, i.e. there
 * should be an imem.mif and a dmem.mif at the same level as process.v. You
 * should figure out how to point your generated imem.v and dmem.v files at
 * these MIF files.
 *
 * imem
 * Inputs:  12-bit address, 1-bit clock enable, and a clock
 * Outputs: 32-bit instruction
 *
 * dmem
 * Inputs:  12-bit address, 1-bit clock, 32-bit data, 1-bit write enable
 * Outputs: 32-bit data at the given address
 *
 */
module processor(
    // Control signals
    clock,                          // I: The master clock
    reset,                          // I: A reset signal

    // Imem
    address_imem,                   // O: The address of the data to get from imem
    q_imem,                         // I: The data from imem

    // Dmem
    address_dmem,                   // O: The address of the data to get or put from/to dmem
    data,                           // O: The data to write to dmem
    wren,                           // O: Write enable for dmem
    q_dmem,                         // I: The data from dmem

    // Regfile
    ctrl_writeEnable,               // O: Write enable for regfile
    ctrl_writeReg,                  // O: Register to write to in regfile
    ctrl_readRegA,                  // O: Register to read from port A of regfile
    ctrl_readRegB,                  // O: Register to read from port B of regfile
    data_writeReg,                  // O: Data to write to for regfile
    data_readRegA,                  // I: Data from port A of regfile
    data_readRegB                   // I: Data from port B of regfile

);
    // Control signals
    input clock, reset;

    // Imem
    output [11:0] address_imem;
    input [31:0] q_imem;

    // Dmem
    output [11:0] address_dmem;
    output [31:0] data;
    output wren;
    input [31:0] q_dmem;

    // Regfile
    output ctrl_writeEnable;
    output [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
    output [31:0] data_writeReg;
    input [31:0] data_readRegA, data_readRegB;

    /* YOUR CODE STARTS HERE */
	 wire [11:0]pc_in,pc_out;
	 wire [31:0] pc1_32,pcn1_32;
	 wire[11:0]pc1,pcn1;
	 wire w0,w1,w2;
	 
	 wire [4:0]opcode,rd,rs,rt,shamt,aluop;
	 wire[31:0]immediate;
	 wire [26:0]target;
	 
	 wire is_overflow;
	 wire is_add,is_sub,is_addi;
	 
	 wire overflow;
	 
	 wire [31:0]aluin1,aluin2,aluout;//?wire
	 wire isNotEqual, isLessThan;
	 
	 wire the_R, the_addi,the_sw,the_lw,the_beq,the_j,the_bne,the_blt;
	 wire DMwe,Rwe,Rwd,Rdst,ALUop,ALUinB,BNE,BLT;
	 //pc & imem
	 
	 
	 
	 pc pc01(clock, reset, pc_in, pc_out);
	 bit12_counter c2(pc_out,pc1);
	 assign pc1_32[11:0]=pc1;
	 assign pc1_32[31:12]=0;
	 alu alu2(pc1_32,immediate, 5'b00000,5'b00000, pcn1_32,,,);
	 and a1(w0,BNE,isNotEqual);
	 and a2(w1,BLT,isLessThan);
	 or o1(w2,w0,w1);
	 assign pcn1=pcn1_32[11:0];
	 assign pc_in=w2?pcn1:pc1;
	 
	 assign address_imem=pc_out[11:0];
	 
	 //regfile
	 
	 
	 assign opcode=q_imem[31:27];
	 assign rd=q_imem[26:22];
	 assign rs=q_imem[21:17];
	 assign rt=q_imem[16:12];
	 assign shamt=the_R?q_imem[11:7]:5'b00000;
	 assign aluop=the_R?q_imem[6:2]:5'b00000;
	 genvar j;
	 generate
		for (j = 31; j>= 17; j = j - 1) begin:hi1
			assign immediate[j]=q_imem[16];
		end
	 endgenerate
	 assign immediate[16:0]=q_imem[16:0];
	 assign target=q_imem[26:0];
	 
	 
	 math m1(opcode,aluop,is_add,is_sub,is_addi);

	 
	 // control_circuit(opcode, DMwe,Rwe,Rwd,Rdst,ALUop,ALUinB);
	 control_circuit c1( opcode,the_R, the_addi,the_sw,the_lw,the_beq,the_j,the_bne,the_blt,DMwe,Rwe,Rwd,Rdst,ALUop,ALUinB,BNE,BLT);
	 
	 assign overflow=(is_overflow&(is_addi|is_add|is_sub));
	 assign ctrl_writeEnable=Rwe;
	 assign ctrl_writeReg=overflow?5'b11110:rd;//rd
	 assign ctrl_readRegA=(the_bne|the_blt)?rd:rs;
	 assign ctrl_readRegB=(the_bne|the_blt)?rs:the_sw?rd:rt;//rd when sw
	 assign data_writeReg=Rwd?q_dmem:~overflow?aluout:is_add?32'd1:is_addi?32'd2:is_sub?32'd3:32'd0;
	 
	 //alu
	
	 assign aluin1=data_readRegA;
	 assign aluin2=ALUinB?immediate:data_readRegB;
	 
	 alu alu1(aluin1,aluin2,aluop,shamt,aluout,isNotEqual, isLessThan,is_overflow);//is_overflow
	 
	 //dmem
	 assign address_dmem=aluout[11:0];
	 assign data=data_readRegB;
	 assign wren=DMwe;

endmodule
