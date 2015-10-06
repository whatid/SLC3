module slc3_tb
(
	input logic Clk, Reset, Run, Continue, 
	input logic [15:0] S
); 

logic [11:0] LED;
logic [6:0] HEX0, HEX1, HEX2, HEX3;
logic CE, UB, LB, OE, WE;
logic [19:0] mem_address;
wire [15:0] mem_data; //tristate buffers need to be of type wire

slc3 fuck
(

	.S,
	.Clk, 
	.Reset, 
	.Run, 
	.Continue,
	.LED, // 12 bits
	.HEX0, 
	.HEX1, 
	.HEX2, 
	.HEX3, // 7 bits
	.CE(CE), 
	.UB(UB),
	.LB(LB), 
	.OE(OE), 
	.WE(WE),
	.ADDR(mem_address), // 20 bits
	.Data(mem_data)  // 16 bits

);

test_memory fuckthis
(
	.Clk,
	.Reset, 
    .I_O (mem_data), // 16 bits
    .A(mem_address), // 20 bits
    .CE(CE),
    .UB(UB),
    .LB(LB),
    .OE(OE),
    .WE(WE) 

);

endmodule : slc3_tb