module mp1
()

logic LD_MAR, LD_MDR, LD_IR, LD_BEN, LD_CC, LD_REG, LD_PC, LD_LED;
logic load_regfile, load_cc; 
logic branch_enable, jsr_sel; 
logic alumux_sel; 
logic GatePC, GateMDR, GateALU, GateMARMUX;
logic SR2MUX, ADDR1MUX, MARMUX, MIO_EN;
logic BEN, offset_sel; 
logic [1:0] PCMUX, DRMUX, SR1MUX, ADDR2MUX, ALUK;
logic [15:0] MDR_In;
logic [15:0] MAR, MDR, IR, PC, ALU, MARMUX_OUT;
logic [15:0] Data_Mem_In, Data_Mem_Out; 
logic [1:0] busMux; 
logic [11:0] ledVect12; 
// CPU BUS 
logic [15:0] cpu_bus; 

assign ADDR = MAR; //Note, our external SRAM chip is 1Mx16, but address space is only 64Kx16

datapath d0
(
	.clk(Clk), 
	.LD_PC, .LD_MAR, .LD_MDR, .LD_IR, .load_regfile(LD_REG), .load_cc(LD_CC),  
	.PCMUX, .DRMUX, .alumux_sel(alumux_sel), 
	.MARMUX, 
	.aluop(ALUK), 
	.MDR_In, 
	.IR, .MAR, .MDR, 
	.ledVect12, 
	.branch_enable, 
	.cpu_bus(cpu_bus), 
	.marmux_out(MARMUX_OUT), 
	.pc_out(PC), 
	.jsr_sel, 
	.alu_out(ALU), 
	.ADDR1MUX, 
	.ADDR2MUX

);

ISDU state_controller(
	.*, .Reset(Reset_ah), .Run(Run_ah), .Continue(Continue_ah), .ContinueIR(1'b0), 
	.Opcode(IR[15:12]), .IR_5(IR[5]), //.IR_11(IR[11]),
	.Mem_CE(CE), .Mem_UB(UB), .Mem_LB(LB), .Mem_OE(OE), .Mem_WE(WE), .busMux(busMux), 
	.alumux_sel, .branch_enable, .jsr_sel
);
