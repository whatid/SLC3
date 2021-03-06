library verilog;
use verilog.vl_types.all;
entity ISDU is
    port(
        Clk             : in     vl_logic;
        Reset           : in     vl_logic;
        Run             : in     vl_logic;
        Continue        : in     vl_logic;
        ContinueIR      : in     vl_logic;
        Opcode          : in     vl_logic_vector(3 downto 0);
        IR_5            : in     vl_logic;
        branch_enable   : in     vl_logic;
        jsr_sel         : in     vl_logic;
        r7_sel          : out    vl_logic;
        imm5_ok         : out    vl_logic;
        LD_MAR          : out    vl_logic;
        LD_MDR          : out    vl_logic;
        LD_IR           : out    vl_logic;
        LD_BEN          : out    vl_logic;
        LD_CC           : out    vl_logic;
        LD_REG          : out    vl_logic;
        LD_PC           : out    vl_logic;
        GatePC          : out    vl_logic;
        GateMDR         : out    vl_logic;
        GateALU         : out    vl_logic;
        GateMARMUX      : out    vl_logic;
        PCMUX           : out    vl_logic_vector(1 downto 0);
        SR1MUX          : out    vl_logic_vector(1 downto 0);
        busMux          : out    vl_logic_vector(1 downto 0);
        SR2MUX          : out    vl_logic;
        ADDR1MUX        : out    vl_logic;
        DRMUX           : out    vl_logic;
        ADDR2MUX        : out    vl_logic_vector(1 downto 0);
        MARMUX          : out    vl_logic;
        alumux_sel      : out    vl_logic;
        ALUK            : out    vl_logic_vector(1 downto 0);
        Mem_CE          : out    vl_logic;
        Mem_UB          : out    vl_logic;
        Mem_LB          : out    vl_logic;
        Mem_OE          : out    vl_logic;
        Mem_WE          : out    vl_logic
    );
end ISDU;
