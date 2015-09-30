module alu
(
    input logic [3:0] aluop,
    input logic [15:0] a, b,
    output logic [15:0] f
);

always_comb
begin
    case (aluop)
        4'b0001: f = a + b; // add
        4'b0101: f = a & b; // and
        4'b1001: f = ~a; // not
        default: $display("Unknown aluop");
    endcase
end

endmodule : alu
