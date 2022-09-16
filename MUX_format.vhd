library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MUX_format is
    Port ( in_a : in  STD_LOGIC_VECTOR (4 downto 0);
           in_b : in  STD_LOGIC_VECTOR (4 downto 0);
           rf_sel : in  STD_LOGIC;
           out_mux_f : out  STD_LOGIC_VECTOR (4 downto 0));
end MUX_format;

architecture Behavioral of MUX_format is

begin
process(in_a,in_b,rf_sel)
begin
	if (rf_sel='1') then
		out_mux_f<=in_b;
	else
		out_mux_f<=in_a;
	end if;
end process ;
end Behavioral;

