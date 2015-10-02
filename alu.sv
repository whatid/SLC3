module alu
(
    input logic [1:0] aluop,
    input logic [15:0] a, b,
    output logic [15:0] f
);

always_comb
begin
    case (aluop)
        2'b00: f = a + b; // add
        2'b01: f = a & b; // and
        2'b10: f = ~a; // not
        2'b11: f = a; 
        default: $display("Unknown aluop");
    endcase
end

endmodule : alu
