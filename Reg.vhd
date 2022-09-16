library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Reg is
    Port ( Clock : in  STD_LOGIC;
           Data : in  STD_LOGIC_VECTOR (31 downto 0);
           we : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Dout : out  STD_LOGIC_VECTOR (31 downto 0));
end Reg;

architecture Behavioral of Reg is
signal temp : std_logic_vector(31 downto 0) := (others => '0');

begin
process
begin
wait until Clock'EVENT and Clock = '1' ;
if Reset='0' then
		if we='1' then
			temp <= Data ;
		else
			temp <= temp;
		end if;
else
	temp <= "00000000000000000000000000000000" ;
end if;
Dout <= temp;
end process;
end Behavioral;
