module datapath
(
	input clk, 
	input LD_PC, LD_MAR, LD_MDR, LD_IR, 
	input [1:0] PCMUX, DRMUX, 
	input MARMUX, 
	input [15:0] MDR_In, 
	output [15:0] IR, MAR, MDR

);

logic pcmux_out; 
logic [15:0] pc_out, pc_plus1_out, mem_data, marmux_out, mdrmux_out; 

mux3 pcmux
(
	.sel(PCMUX), 
	.a(pc_plus1_out), 
	.b(16'b0), 
	.c(16'b0), 
	.f(16'b0)
);

register pc
(
    .clk(clk),
    .load(LD_PC),
    .in(pc_plus1_out),
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
 	.a(pc_out),
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
    .load(load_ir),
    .in(mem_wdata),
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
    .jsr_sel(jsr_sel)
);

sext imm5_sext
(
    .in(imm5),
    .out(imm5_op)
);

mux2 alumux
(
    .sel(imm5_sel), 
    .a(sr2), 
    .b(imm5_op),
    .f(alumux_out)
);

alu ArithmeticLogicUnit
(
    .aluop(aluop),
    .a(sr1),
    .b(alumux_out),
    .f(alu_out)

);

regfile regfileunit
(
    .clk(clk),
    .load(load_regfile),
    .in(regfilemux_out),
    .src_a(storemux_out), 
    .src_b(sr2), 
    .dest(r7mux_out),
    .reg_a(sr1_out), 
    .reg_b(sr2_out)
);

gencc genccunit
(
    .in(regfilemux_out),
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