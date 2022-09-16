library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MUX_ALU_or_Mem is
    Port ( aluout : in  STD_LOGIC_VECTOR (31 downto 0);
           memout : in  STD_LOGIC_VECTOR (31 downto 0);
			  immed : in  STD_LOGIC_VECTOR (31 downto 0);
           sel : in  STD_LOGIC_VECTOR (1 downto 0);
           out_mux : out  STD_LOGIC_VECTOR (31 downto 0));
end MUX_ALU_or_Mem;

architecture Behavioral of MUX_ALU_or_Mem is

begin
process(aluout,memout,sel)
begin
	if (sel = "01") then
		out_mux<=memout;
	elsif (sel = "10") then
		out_mux<=immed;
	else
		out_mux<=aluout;
	end if;
end process;
end Behavioral;

