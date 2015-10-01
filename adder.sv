module adder
(
	input logic [15:0] a,b,
	output logic [15:0] f
);

always_comb
begin
	f = a + b;
end
endmodule : adder