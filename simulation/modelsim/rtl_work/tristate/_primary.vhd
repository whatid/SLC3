library verilog;
use verilog.vl_types.all;
entity tristate is
    generic(
        N               : integer := 16
    );
    port(
        Clk             : in     vl_logic;
        OE              : in     vl_logic;
        \In\            : in     vl_logic_vector;
        \Out\           : out    vl_logic_vector;
        Data            : inout  vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of N : constant is 1;
end tristate;
