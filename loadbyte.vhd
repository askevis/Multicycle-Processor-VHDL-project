library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity loadbyte is
    Port ( input : in  STD_LOGIC_VECTOR (31 downto 0);
           output : out  STD_LOGIC_VECTOR (31 downto 0);
           Opcode : in  STD_LOGIC_VECTOR (5 downto 0));
end loadbyte;

architecture Behavioral of loadbyte is

begin

	proc : process (input, Opcode)
	
	begin
		
		if (Opcode="000011" or Opcode="000111") then
			output(7 downto 0)<=input(7 downto 0);
			output(31 downto 8)<=(others => '0');
		else output<=input;
			
		end if;
		
	end process;


end Behavioral;