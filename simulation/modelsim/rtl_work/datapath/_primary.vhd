library verilog;
use verilog.vl_types.all;
entity datapath is
    port(
        clk             : in     vl_logic;
        LD_PC           : in     vl_logic;
        LD_MAR          : in     vl_logic;
        LD_MDR          : in     vl_logic;
        LD_IR           : in     vl_logic;
        load_regfile    : in     vl_logic;
        load_cc         : in     vl_logic;
        imm5_ok         : in     vl_logic;
        PCMUX           : in     vl_logic_vector(1 downto 0);
        ADDR2MUX        : in     vl_logic_vector(1 downto 0);
        cpu_bus         : in     vl_logic_vector(15 downto 0);
        MDR_In          : in     vl_logic_vector(15 downto 0);
        r7_sel          : in     vl_logic;
        DRMUX           : in     vl_logic;
        MARMUX          : in     vl_logic;
        ADDR1MUX        : in     vl_logic;
        alumux_sel      : in     vl_logic;
        aluop           : in     vl_logic_vector(1 downto 0);
        IR              : out    vl_logic_vector(15 downto 0);
        MAR             : out    vl_logic_vector(15 downto 0);
        pc_out          : out    vl_logic_vector(15 downto 0);
        marmux_out      : out    vl_logic_vector(15 downto 0);
        alu_out         : out    vl_logic_vector(15 downto 0);
        MDR_OUT         : out    vl_logic_vector(15 downto 0);
        ledVect12       : out    vl_logic_vector(11 downto 0);
        branch_enable   : out    vl_logic;
        jsr_sel         : out    vl_logic
    );
end datapath;
