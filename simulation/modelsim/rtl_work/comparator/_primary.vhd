library verilog;
use verilog.vl_types.all;
entity comparator is
    port(
        a               : in     vl_logic_vector(2 downto 0);
        b               : in     vl_logic_vector(2 downto 0);
        f               : out    vl_logic
    );
end comparator;
