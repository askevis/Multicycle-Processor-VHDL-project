library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALUSTAGE is
    Port ( RF_A : in  STD_LOGIC_VECTOR (31 downto 0);
           RF_B : in  STD_LOGIC_VECTOR (31 downto 0);
           Immed : in  STD_LOGIC_VECTOR (31 downto 0);
           ALU_Bin_sel : in  STD_LOGIC;
           ALU_func : in  STD_LOGIC_VECTOR (3 downto 0);
           ALU_out : out  STD_LOGIC_VECTOR (31 downto 0);
			  ALU_zero : out  STD_LOGIC);
			  --ALU_cout : out  STD_LOGIC;
			  --ALU_ovf : out  STD_LOGIC);
end ALUSTAGE;

architecture Behavioral of ALUSTAGE is

component ALU is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           Op : in  STD_LOGIC_VECTOR (3 downto 0);
           Output : out  STD_LOGIC_VECTOR (31 downto 0);
           Zero : out  STD_LOGIC;
           Cout : out  STD_LOGIC;
           Ovf : out  STD_LOGIC);
end component;

component MUX_2x1 is
    Port ( mdin : in  STD_LOGIC_VECTOR (31 downto 0);
           bmout : in  STD_LOGIC_VECTOR (31 downto 0);
           selcomp : in  STD_LOGIC;
           mout : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

signal mux_to_alu :STD_LOGIC_VECTOR (31 downto 0);
--signal alu_zero,alu_cout,alu_ovf : STD_LOGIC;

begin

muxalu: MUX_2x1
port map ( mdin => Immed,
			  bmout => RF_B,
			  selcomp => ALU_Bin_sel,
			  mout => mux_to_alu );

alu_comp: ALU
port map ( A => RF_A,
			  B => mux_to_alu,
			  Op => ALU_func,
			  Output => ALU_out,
			  Zero => ALU_zero
			 --Cout => ALU_cout,
			 --Ovf => ALU_ovf 
			  );

end Behavioral;

