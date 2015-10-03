module datapath
(
	input clk, 
	input LD_PC, LD_MAR, LD_MDR, LD_IR, load_regfile, load_cc,  
	input [1:0] PCMUX, DRMUX, alumux_sel, ADDR2MUX, 
	input [15:0] cpu_bus, 
	input MARMUX, ADDR1MUX, 
	input [3:0] aluop, 
	input [15:0] MDR_In, 
	output [15:0] IR, MAR, MDR, pc_out, marmux_out, alu_out, 
	output [11:0] ledVect12, 
	output logic branch_enable, jsr_sel

);
// internal signals
logic [4:0] imm5; 
logic imm5_sel; 
logic [3:0] opcode; 
logic [5:0] offset6; 
logic [10:0] offset11; 
logic [8:0] offset9; 
logic [2:0] dest, sr1, sr2, storemux_out, gencc_out, cc_out; 
logic [15:0] pc_plus1_out, mem_data, mdrmux_out, br_adder_out, offset9_out, offset11_out, addermux_out, offset6_out, pcmux_out, imm5_op, sr2_out; 
logic [15:0] sr2mux_out, alumux_out, sr1_out, adder2mux_out, adder1mux_out; 

mux4 pcmux
(
	.sel(PCMUX), 
	.a(pc_plus1_out), 
	.b(cpu_bus), 
	.c(br_adder_out),
	.d(16'b0), 
	.f(pcmux_out)
);

mux3 adder2mux
(
    .sel(ADDR2MUX),
    .a(offset11_out),
    .b(offset9_out),
    .c(offset6_out), 
    .f(adder2mux_out)
);

mux2 adder1mux
(
    .sel(ADDR1MUX), 
    .a(pc_out),
    .b(sr1_out),
    .f(adder1mux_out)
);

sext offset6_sext
(
    .in(offset6), 
    .out(offset6_out)
);

sext pc_offset11
(
    .in(offset11), 
    .out(offset11_out)
);

sext pc_offset9
(
    .in(offset9),
    .out(offset9_out)
);

adder br_adder
(
    .a(adder1mux_out),
    .b(adder2mux_out),
    .f(br_adder_out)
);

register pc
(
    .clk(clk),
    .load(LD_PC),
    .in(pcmux_out),
    .out(pc_out)
);

 plus1 plus1unit
 (
	.in(pc_out),
	.out(pc_plus1_out)
 );

 mux2 marmux
 (
 	.sel(MARMUX), 
 	.a(br_adder_out),
 	.b(16'b0),
 	.f(marmux_out)
 );

register mar
(
    .clk(clk),
    .load(LD_MAR),
    .in(marmux_out),
    .out(MAR)
);

mux3 mdrmux 
(
    .sel(DRMUX),
    .a(MDR_In),
    .b(16'b0),
	 .c(16'b0),
    .f(mdrmux_out)
);

register mdr
(
    .clk(clk),
    .load(LD_MDR),
    .in(mdrmux_out),
    .out(MDR)
);

ir irunit
(
    .clk(clk),  
    .load(LD_IR),
    .in(cpu_bus),
    .opcode(opcode),
    .dest(dest),
    .src1(sr1),
    .src2(sr2),
    .offset6(offset6),
    .offset9(offset9),
    .ledVect12(ledVect12), 
    .imm5(imm5),
    .imm5_sel(imm5_sel), 
    .offset11(offset11),
    .jsr_sel(jsr_sel), 
	 .ir_out(IR)
);

sext imm5_sext
(
    .in(imm5),
    .out(imm5_op)
);

mux2 sr2mux
(
    .sel(imm5_sel), 
    .a(sr2_out), 
    .b(imm5_op),
    .f(sr2mux_out)
);

mux2 alumux
(
    .sel(alumux_sel), 
    .a(sr2mux_out),
    .b(offset6_out),
    .f(alumux_out)
);

alu ArithmeticLogicUnit
(
    .aluop(aluop),
    .a(sr1_out),
    .b(alumux_out),
    .f(alu_out)

);

mux2 storemux
(
    .sel(jsr_sel),
    .a(sr1),
    .b(3'b111),
    .f(storemux_out)
);

regfile regfileunit
(
    .clk(clk),
    .load(load_regfile),
    .in(cpu_bus),
    .src_a(storemux_out), 
    .src_b(sr2), 
    .dest(dest),
    .reg_a(sr1_out), 
    .reg_b(sr2_out)
);

gencc genccunit
(
    .in(cpu_bus),
    .out(gencc_out)
);

 register #(.width(3)) cc
(
    .clk(clk),
    .load(load_cc),
    .in(gencc_out),
    .out(cc_out)
);

 comparator nzpcomparator
 (
    .a(dest),
    .b(cc_out),
    .f(branch_enable)
 );



endmodule : datapath