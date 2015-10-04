library verilog;
use verilog.vl_types.all;
entity ir is
    port(
        clk             : in     vl_logic;
        load            : in     vl_logic;
        \in\            : in     vl_logic_vector(15 downto 0);
        opcode          : out    vl_logic_vector(3 downto 0);
        dest            : out    vl_logic_vector(2 downto 0);
        src1            : out    vl_logic_vector(2 downto 0);
        src2            : out    vl_logic_vector(2 downto 0);
        offset6         : out    vl_logic_vector(5 downto 0);
        offset9         : out    vl_logic_vector(8 downto 0);
        offset11        : out    vl_logic_vector(10 downto 0);
        ledVect12       : out    vl_logic_vector(11 downto 0);
        imm5            : out    vl_logic_vector(4 downto 0);
        imm5_sel        : out    vl_logic;
        jsr_sel         : out    vl_logic;
        ir_out          : out    vl_logic_vector(15 downto 0)
    );
end ir;
