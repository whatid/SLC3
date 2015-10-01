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
	.b(cpu_bus), 
	.c(br_adder_out), 
	.f(pcmux_out)
);

mux2 addermux
(
    .sel(),
    .a(offset9_out),
    .b(offset11_out),
    .f(addermux_out)
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
    .a(addermux_out),
    .b(pc_out),
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
    .f(cpu_bus)

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