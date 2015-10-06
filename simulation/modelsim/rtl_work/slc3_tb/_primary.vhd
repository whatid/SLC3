library verilog;
use verilog.vl_types.all;
entity slc3_tb is
    port(
        Clk             : in     vl_logic;
        Reset           : in     vl_logic;
        Run             : in     vl_logic;
        Continue        : in     vl_logic;
        S               : in     vl_logic_vector(15 downto 0)
    );
end slc3_tb;
