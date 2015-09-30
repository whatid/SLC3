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

register ir 
(
    .clk(clk),
    .load(LD_IR),
    .in(MDR),
    .out(IR)
);

endmodule : datapath