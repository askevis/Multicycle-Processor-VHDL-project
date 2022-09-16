library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Decoder is
    Port ( awr1 : in  STD_LOGIC_VECTOR (4 downto 0);
           Oawr : out  STD_LOGIC_VECTOR (31 downto 0));
end Decoder;

architecture Behavioral of Decoder is

begin
process(awr1)
begin
if (awr1="00000") then
Oawr <= "00000000000000000000000000000001" after 5ns;
elsif (awr1="00001") then
Oawr <= "00000000000000000000000000000010" after 5ns;
elsif (awr1="00010") then
Oawr <= "00000000000000000000000000000100" after 5ns;
elsif (awr1="00011") then
Oawr <= "00000000000000000000000000001000" after 5ns;
elsif (awr1="00100") then
Oawr <= "00000000000000000000000000010000" after 5ns;
elsif (awr1="00101") then
Oawr <= "00000000000000000000000000100000" after 5ns;
elsif (awr1="00110") then
Oawr <= "00000000000000000000000001000000" after 5ns;
elsif (awr1="00111") then
Oawr <= "00000000000000000000000010000000" after 5ns;
elsif (awr1="01000") then
Oawr <= "00000000000000000000000100000000" after 5ns;
elsif (awr1="01001") then
Oawr <= "00000000000000000000001000000000" after 5ns;
elsif (awr1="01010") then
Oawr <= "00000000000000000000010000000000" after 5ns;
elsif (awr1="01011") then
Oawr <= "00000000000000000000100000000000" after 5ns;
elsif (awr1="01100") then
Oawr <= "00000000000000000001000000000000" after 5ns;
elsif (awr1="01101") then
Oawr <= "00000000000000000010000000000000" after 5ns;
elsif (awr1="01110") then
Oawr <= "00000000000000000100000000000000" after 5ns;
elsif (awr1="01111") then
Oawr <= "00000000000000001000000000000000" after 5ns;
elsif (awr1="10000") then
Oawr <= "00000000000000010000000000000000" after 5ns;
elsif (awr1="10001") then
Oawr <= "00000000000000100000000000000000" after 5ns;
elsif (awr1="10010") then
Oawr <= "00000000000001000000000000000000" after 5ns;
elsif (awr1="10011") then
Oawr <= "00000000000010000000000000000000" after 5ns;
elsif (awr1="10100") then
Oawr <= "00000000000100000000000000000000" after 5ns;
elsif (awr1="10101") then
Oawr <= "00000000001000000000000000000000" after 5ns;
elsif (awr1="10110") then
Oawr <= "00000000010000000000000000000000" after 5ns;
elsif (awr1="10111") then
Oawr <= "00000000100000000000000000000000" after 5ns;
elsif (awr1="11000") then
Oawr <= "00000001000000000000000000000000" after 5ns;
elsif (awr1="11001") then
Oawr <= "00000010000000000000000000000000" after 5ns;
elsif (awr1="11010") then
Oawr <= "00000100000000000000000000000000" after 5ns;
elsif (awr1="11011") then
Oawr <= "00001000000000000000000000000000" after 5ns;
elsif (awr1="11100") then
Oawr <= "00010000000000000000000000000000" after 5ns;
elsif (awr1="11101") then
Oawr <= "00100000000000000000000000000000" after 5ns;
elsif (awr1="11110") then
Oawr <= "01000000000000000000000000000000" after 5ns;
elsif (awr1="11111") then
Oawr <= "10000000000000000000000000000000" after 5ns;
end if;
end process;
end Behavioral;
