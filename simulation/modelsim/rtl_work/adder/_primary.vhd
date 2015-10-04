library verilog;
use verilog.vl_types.all;
entity adder is
    port(
        a               : in     vl_logic_vector(15 downto 0);
        b               : in     vl_logic_vector(15 downto 0);
        f               : out    vl_logic_vector(15 downto 0)
    );
end adder;
