library verilog;
use verilog.vl_types.all;
entity slc3 is
    port(
        S               : in     vl_logic_vector(15 downto 0);
        Clk             : in     vl_logic;
        Reset           : in     vl_logic;
        Run             : in     vl_logic;
        Continue        : in     vl_logic;
        LED             : out    vl_logic_vector(11 downto 0);
        HEX0            : out    vl_logic_vector(6 downto 0);
        HEX1            : out    vl_logic_vector(6 downto 0);
        HEX2            : out    vl_logic_vector(6 downto 0);
        HEX3            : out    vl_logic_vector(6 downto 0);
        CE              : out    vl_logic;
        UB              : out    vl_logic;
        LB              : out    vl_logic;
        OE              : out    vl_logic;
        WE              : out    vl_logic;
        ADDR            : out    vl_logic_vector(19 downto 0);
        mdata           : in     vl_logic_vector(15 downto 0);
        Data            : inout  vl_logic_vector(15 downto 0)
    );
end slc3;
