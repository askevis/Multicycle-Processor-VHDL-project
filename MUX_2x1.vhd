library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MUX_2x1 is
    Port ( mdin : in  STD_LOGIC_VECTOR (31 downto 0);
           bmout : in  STD_LOGIC_VECTOR (31 downto 0);
           selcomp : in  STD_LOGIC;
           mout : out  STD_LOGIC_VECTOR (31 downto 0));
end MUX_2x1;

architecture Behavioral of MUX_2x1 is

begin
process(selcomp,mdin,bmout)
begin
	if (selcomp='1') then
		mout<=mdin;
	else
		mout<=bmout;
	end if;
end process;
end Behavioral;

