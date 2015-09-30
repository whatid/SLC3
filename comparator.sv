module comparator
(
	input logic [2:0] a,
	input logic [2:0] b,
	output logic f

);

always_comb
begin
	if ((a[2] && b[2]) || (a[1] && b[1]) || (a[0] && b[0]))
		f = 1;
	else 
		f = 0;
end
endmodule : comparator