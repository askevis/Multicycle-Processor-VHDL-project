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

entity MemWrAddr is
    Port ( addrin : in  STD_LOGIC_VECTOR (10 downto 0);
           addrout : out  STD_LOGIC_VECTOR (10 downto 0));
end MemWrAddr;

architecture Behavioral of MemWrAddr is

begin

addrout<=addrin+1024;

end Behavioral;

