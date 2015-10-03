module ir
(
    input clk,
    input load,
    input logic [15:0] in,
    output logic [3:0] opcode,
    output logic [2:0] dest, src1, src2,
    output logic [5:0] offset6,
    output logic [8:0] offset9,
	output logic [10:0] offset11,
	output logic [11:0] ledVect12, 
	output logic [4:0] imm5,
	output logic imm5_sel, 
	output logic jsr_sel

);

logic [15:0] data;

always_ff @(posedge clk)
begin
    if (load == 1)
    begin
        data = in;
    end
end

always_comb
begin
    opcode = data[15:12];

    dest = data[11:9];
    src1 = data[8:6];
    src2 = data[2:0];
	 
	 
	imm5 = data[4:0];
	imm5_sel = data[5];
	jsr_sel = data[11]; 
	
	ledVect12 = data[11:0];  
	offset11 = data[10:0];
    offset6 = data[5:0];
    offset9 = data[8:0];
end

endmodule : ir
