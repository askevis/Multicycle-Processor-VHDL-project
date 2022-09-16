library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DECSTAGE is
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
           RF_A : out  STD_LOGIC_VECTOR (31 downto 0);
           RF_B : out  STD_LOGIC_VECTOR (31 downto 0));
end DECSTAGE;

architecture Behavioral of DECSTAGE is

component Reg_File_Top_Level is
    Port ( clk : in  STD_LOGIC;
           Ard1 : in  STD_LOGIC_VECTOR (4 downto 0);
           Ard2 : in  STD_LOGIC_VECTOR (4 downto 0);
           Awr : in  STD_LOGIC_VECTOR (4 downto 0);
			  Din : in  STD_LOGIC_VECTOR (31 downto 0);
           WrEn : in  STD_LOGIC;
			  rst : in  STD_LOGIC;
           Dout1 : out  STD_LOGIC_VECTOR (31 downto 0);
           Dout2 : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component MUX_ALU_or_Mem is
    Port ( aluout : in  STD_LOGIC_VECTOR (31 downto 0);
           memout : in  STD_LOGIC_VECTOR (31 downto 0);
			  immed : in  STD_LOGIC_VECTOR (31 downto 0);
           sel : in  STD_LOGIC_VECTOR (1 downto 0);
           out_mux : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component MUX_format is
    Port ( in_a : in  STD_LOGIC_VECTOR (4 downto 0);
           in_b : in  STD_LOGIC_VECTOR (4 downto 0);
           rf_sel : in  STD_LOGIC;
           out_mux_f : out  STD_LOGIC_VECTOR (4 downto 0));
end component;

component Immed_create is
    Port ( instr_c : in  STD_LOGIC_VECTOR (15 downto 0);
           op_cod : in  STD_LOGIC_VECTOR (5 downto 0);
           immed_c : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component loadbyte
    Port ( input : in  STD_LOGIC_VECTOR (31 downto 0);
           output : out  STD_LOGIC_VECTOR (31 downto 0);
           Opcode : in  STD_LOGIC_VECTOR (5 downto 0));
end component;

signal mux_mikrou_out: STD_LOGIC_VECTOR (4 downto 0);
signal mux_megalou_out: STD_LOGIC_VECTOR (31 downto 0);
signal Dec_byte : STD_LOGIC_VECTOR (31 downto 0);

begin

mux_1: MUX_format
port map ( in_a => Instr (15 downto 11),          
			  in_b => Instr (20 downto 16),
			  rf_sel => RF_B_sel,
			  out_mux_f => mux_mikrou_out );
			 
mux_2 : MUX_ALU_or_Mem
port map ( aluout => ALU_out, 
			  memout => Dec_byte,
			  immed => Immedin,
			  sel => RF_WrData_sel(1 downto 0),
			  out_mux => mux_megalou_out );

Register_File : Reg_File_Top_Level 
port map ( clk => Clk,
			  Ard1 => Instr (25 downto 21),
			  Ard2 => mux_mikrou_out ,
			  Awr => Instr (20 downto 16),
			  Din => mux_megalou_out,
			  WrEn => RF_WrEn,
			  rst => Reset,
			  Dout1 => RF_A,
			  Dout2 => RF_B );
			  
byte_ins : loadbyte
	 port map( input=>MEM_out,
				  output=>Dec_byte,
		        Opcode=>Instr(31 downto 26));
			  
Immediate: Immed_create 
Port map ( instr_c => Instr(15 downto 0),
			  op_cod => Instr(31 downto 26),
			  immed_c =>Immedout);

end Behavioral;

