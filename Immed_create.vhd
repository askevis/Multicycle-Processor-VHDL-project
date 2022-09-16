library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Immed_create is
    Port ( instr_c : in  STD_LOGIC_VECTOR (15 downto 0);
           op_cod : in  STD_LOGIC_VECTOR (5 downto 0);
           immed_c : out  STD_LOGIC_VECTOR (31 downto 0));
end Immed_create;

architecture Behavioral of Immed_create is

begin
process(instr_c,op_cod)
begin
	if ( op_cod="110000" or op_cod="111000" or op_cod="000011" or op_cod="000111" or op_cod="001111" or op_cod="011111") then
		immed_c<=(31 downto 16 =>instr_c(15)) & instr_c;         -- periptwseis gia sign extention
	elsif( op_cod="111111" or op_cod="000000" or op_cod="000001") then
		immed_c<=(31 downto 18 =>instr_c(15)) & instr_c & "00";	-- periptwseis gia sign extention kai shift kata 2
	elsif( op_cod="111001") then
		immed_c<= instr_c  & "0000000000000000" ;           -- to lui
	else 
		immed_c<=(31 downto 16 =>'0') & instr_c;            -- periptwseis gia zero filling
end if;
end process;
end Behavioral;

