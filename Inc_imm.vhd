library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Inc_imm is
    Port ( inc_imin : in  STD_LOGIC_VECTOR (31 downto 0);
           inc_in : in  STD_LOGIC_VECTOR (31 downto 0);
           inc_imout : out  STD_LOGIC_VECTOR (31 downto 0));
end Inc_imm;

architecture Behavioral of Inc_imm is

begin

inc_imout <= inc_in + 4 + inc_imin;

end Behavioral;

