library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with TOPned or UnTOPned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


entity TOPLEVEL is
	Port(	PC_sel : in  STD_LOGIC;
			PC_LdEn : in  STD_LOGIC;
		   rst : in  STD_LOGIC;
			Clk : in  STD_LOGIC;
			Mem_WrEn : in  STD_LOGIC;
			RF_WrEn : in  STD_LOGIC;
			RF_WrData_sel : in  STD_LOGIC_VECTOR (1 downto 0);
			RF_B_sel : in  STD_LOGIC;
			ALU_func : in  STD_LOGIC_VECTOR (3 downto 0);
			ALU_Bin_sel : in  STD_LOGIC;
			ALU_zero : out STD_LOGIC;
			Instr : out STD_LOGIC_VECTOR (31 downto 0));

end TOPLEVEL;
architecture Behavioral of TOPLEVEL is

component ALUSTAGE is
    Port ( RF_A : in  STD_LOGIC_VECTOR (31 downto 0);
           RF_B : in  STD_LOGIC_VECTOR (31 downto 0);
           Immed : in  STD_LOGIC_VECTOR (31 downto 0);
           ALU_Bin_sel : in  STD_LOGIC;
           ALU_func : in  STD_LOGIC_VECTOR (3 downto 0);
           ALU_out : out  STD_LOGIC_VECTOR (31 downto 0);
			  ALU_zero : out  STD_LOGIC
			  --ALU_cout : out  STD_LOGIC;
			  --ALU_ovf : out  STD_LOGIC
			  );
end component;

component IFSTAGE is
    Port ( PC_Immed : in  STD_LOGIC_VECTOR (31 downto 0);
           PC_sel : in  STD_LOGIC;
           PC_LdEn : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           Instr : out  STD_LOGIC_VECTOR (31 downto 0);
			  Mem_WrEn : in  STD_LOGIC;
           ALU_MEM_Addr : in  STD_LOGIC_VECTOR (31 downto 0);
           MEM_DataIn : in  STD_LOGIC_VECTOR (31 downto 0);
           MEM_DataOut : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component DECSTAGE is
    Port ( Instr : in  STD_LOGIC_VECTOR (31 downto 0);
           RF_WrEn : in  STD_LOGIC;
           ALU_out : in  STD_LOGIC_VECTOR (31 downto 0);
           MEM_out : in  STD_LOGIC_VECTOR (31 downto 0);
           RF_WrData_sel : in  STD_LOGIC_VECTOR (1 downto 0);
           RF_B_sel : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
			  Reset : in  STD_LOGIC;
           Immedin : in  STD_LOGIC_VECTOR (31 downto 0);
			  Immedout : out STD_LOGIC_VECTOR (31 downto 0);
           RF_A : inout  STD_LOGIC_VECTOR (31 downto 0);
           RF_B : out  STD_LOGIC_VECTOR (31 downto 0));
end component;



signal  pc_out,zeroOut1,zeroOut2,imm_to_stages,rom_out,alu_to_RFwmux,mem_to_RFwmux,ALUout,RF_Aalu : STD_LOGIC_VECTOR (31 downto 0);
signal  mux_to_ram,mux_from_ram,mux_rf,mux_mem,RF_B_tomux,TOP_immediate, TOP_instr, TOP_ALU_out, TOP_mem_out, TOP_RF_B, TOP_RF_A  :STD_LOGIC_VECTOR (31 downto 0);

begin

DEC_STAGE : DECSTAGE
			Port map(RF_B_sel=>RF_B_sel,
						ALU_out=>TOP_alu_out,
						MEM_out=>TOP_mem_out,
						Clk=>Clk,
						Instr=>TOP_instr,
						RF_WrEn=>RF_WrEn,
						RF_WrData_sel=>RF_WrData_sel(1 downto 0),
						Immedin=>TOP_immediate,
						Immedout=>TOP_immediate,
						RF_A=>TOP_RF_A,
						RF_B=>TOP_RF_B,
						Reset=>rst);

IF_STAGE:IFSTAGE
    Port map( 		Reset=>rst,
						Clk=>Clk,
						Instr=>TOP_instr,
						PC_Immed=>TOP_immediate,
						PC_sel=>PC_sel,
						PC_LdEn=>PC_LdEn,
						Mem_WrEn=>Mem_WrEn,
						ALU_MEM_Addr=>TOP_ALU_out,
						MEM_DataIn=>TOP_RF_B,
						MEM_DataOut=>TOP_mem_out);

			
ALU_STAGE : ALUSTAGE
			Port map(RF_A=>TOP_RF_A,
						RF_B=>TOP_RF_B,
						Immed=>TOP_immediate,
						ALU_Bin_sel=>ALU_Bin_sel,
						ALU_func=>ALU_func,
						ALU_out=>TOP_alu_out,
						ALU_zero=>ALU_zero);
			

Instr<=TOP_instr;



end Behavioral;