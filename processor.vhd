library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity processor is
    Port ( rst : in  STD_LOGIC;
           clk : in  STD_LOGIC);
end processor;

architecture Behavioral of processor is

component TOPLEVEL is
	Port( PC_sel : in  STD_LOGIC;
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
 
end component;

component control is
    Port ( Opcode : in  STD_LOGIC_VECTOR (5 downto 0);
           Func : in STD_LOGIC_VECTOR (3 downto 0);
			  ALU_Zero : in  STD_LOGIC;
			  clk : in STD_LOGIC;
			  PC_Sel : out  STD_LOGIC;
           PC_LdEn : out  STD_LOGIC;
           RF_B_sel : out  STD_LOGIC;
           RF_WrData_sel : out  STD_LOGIC_VECTOR (1 downto 0);
           ALU_Bin_sel : out  STD_LOGIC;
           RF_Wr_en : out  STD_LOGIC;
			  rst_in : in STD_LOGIC;
			  rst_out : out STD_LOGIC;
			  ALU_func : out  STD_LOGIC_VECTOR (3 downto 0);
           MEM_Wr_En : out  STD_LOGIC);
end component;
 
 
signal TOP_PC_sel : STD_LOGIC;
signal TOP_PC_LdEn : STD_LOGIC;
signal TOP_Mem_WrEn : STD_LOGIC;
signal TOP_RF_WrEn : STD_LOGIC;
signal TOP_RF_WrData_sel : STD_LOGIC_VECTOR (1 downto 0);
signal TOP_RF_B_sel : STD_LOGIC;
signal TOP_ALU_Bin_sel : STD_LOGIC;
signal TOP_ALU_zero : STD_LOGIC;
signal TOP_ALU_func : STD_LOGIC_VECTOR(3 downto 0);
signal TOP_Instr : STD_LOGIC_VECTOR(31 downto 0);
signal TOP_rst : STD_LOGIC;

begin

TOP_LEVEL : TOPLEVEL 
		 port map( PC_sel=>TOP_PC_sel,
					  PC_LdEn=>TOP_PC_LdEn,
		           rst=>TOP_rst,
			        Clk=>clk,
			        Mem_WrEn=>TOP_Mem_WrEn,
			        RF_WrEn=>TOP_RF_WrEn,
			        RF_WrData_sel=>TOP_RF_WrData_sel,
			        RF_B_sel=>TOP_RF_B_sel,
			        ALU_func=>TOP_ALU_func,
			        ALU_Bin_sel=>TOP_ALU_Bin_sel,
			        ALU_zero=>TOP_ALU_zero,
			        Instr=>TOP_Instr);

cntrl : control 
		  port map( Opcode =>TOP_Instr(31 downto 26),
                  Func=>TOP_Instr(3 downto 0),
						ALU_Zero=>TOP_ALU_zero,
						PC_Sel=>TOP_PC_sel,
						clk=>clk,
						PC_LdEn=>TOP_PC_LdEn,
					   RF_B_sel=>TOP_RF_B_sel,
					   RF_WrData_sel=>TOP_RF_WrData_sel(1 downto 0),
					   ALU_Bin_sel=>TOP_ALU_Bin_sel,
					   RF_Wr_en=>TOP_RF_WrEn,
						rst_in=>rst,
						rst_out=>TOP_rst,
					   ALU_func=>TOP_ALU_func,
					   MEM_Wr_En=>TOP_Mem_WrEn);
end Behavioral;

