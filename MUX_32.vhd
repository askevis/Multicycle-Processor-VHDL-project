library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MUX_32 is
    Port ( d0 : in  STD_LOGIC_VECTOR (31 downto 0);
           d1 : in  STD_LOGIC_VECTOR (31 downto 0);
           d2 : in  STD_LOGIC_VECTOR (31 downto 0);
           d3 : in  STD_LOGIC_VECTOR (31 downto 0);
           d4 : in  STD_LOGIC_VECTOR (31 downto 0);
           d5 : in  STD_LOGIC_VECTOR (31 downto 0);
           d6 : in  STD_LOGIC_VECTOR (31 downto 0);
           d7 : in  STD_LOGIC_VECTOR (31 downto 0);
           d8 : in  STD_LOGIC_VECTOR (31 downto 0);
           d9 : in  STD_LOGIC_VECTOR (31 downto 0);
           d10 : in  STD_LOGIC_VECTOR (31 downto 0);
           d11 : in  STD_LOGIC_VECTOR (31 downto 0);
           d12 : in  STD_LOGIC_VECTOR (31 downto 0);
           d13 : in  STD_LOGIC_VECTOR (31 downto 0);
           d14 : in  STD_LOGIC_VECTOR (31 downto 0);
           d15 : in  STD_LOGIC_VECTOR (31 downto 0);
           d16 : in  STD_LOGIC_VECTOR (31 downto 0);
           d17 : in  STD_LOGIC_VECTOR (31 downto 0);
           d18 : in  STD_LOGIC_VECTOR (31 downto 0);
           d19 : in  STD_LOGIC_VECTOR (31 downto 0);
           d20 : in  STD_LOGIC_VECTOR (31 downto 0);
           d21 : in  STD_LOGIC_VECTOR (31 downto 0);
           d22 : in  STD_LOGIC_VECTOR (31 downto 0);
           d23 : in  STD_LOGIC_VECTOR (31 downto 0);
           d24 : in  STD_LOGIC_VECTOR (31 downto 0);
           d25 : in  STD_LOGIC_VECTOR (31 downto 0);
           d26 : in  STD_LOGIC_VECTOR (31 downto 0);
           d27 : in  STD_LOGIC_VECTOR (31 downto 0);
           d28 : in  STD_LOGIC_VECTOR (31 downto 0);
           d29 : in  STD_LOGIC_VECTOR (31 downto 0);
           d30 : in  STD_LOGIC_VECTOR (31 downto 0);
           d31 : in  STD_LOGIC_VECTOR (31 downto 0);
           mux_select : in  STD_LOGIC_VECTOR (4 downto 0);
           mux_out : out  STD_LOGIC_VECTOR (31 downto 0));
end MUX_32;

architecture Behavioral of MUX_32 is

begin
process(mux_select,d0,d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15,d16,d17,d18,d19,d20,d21,d22,d23,d24,d25,d26,d27,d28,d29,d30,d31)
begin

if (mux_select="00000") then
mux_out <= d0 after 5ns;
elsif (mux_select="00001") then
mux_out <= d1 after 5ns;
elsif (mux_select="00010") then
mux_out <= d2 after 5ns;
elsif (mux_select="00011") then
mux_out <= d3 after 5ns;
elsif (mux_select="00100") then
mux_out <= d4 after 5ns;
elsif (mux_select="00101") then
mux_out <= d5 after 5ns;
elsif (mux_select="00110") then
mux_out <= d6 after 5ns;
elsif (mux_select="00111") then
mux_out <= d7 after 5ns;
elsif (mux_select="01000") then
mux_out <= d8 after 5ns;
elsif (mux_select="01001") then
mux_out <= d9 after 5ns;
elsif (mux_select="01010") then
mux_out <= d10 after 5ns;
elsif (mux_select="01011") then
mux_out <= d11 after 5ns;
elsif (mux_select="01100") then
mux_out <= d12 after 5ns;
elsif (mux_select="01101") then
mux_out <= d13 after 5ns;
elsif (mux_select="01110") then
mux_out <= d14 after 5ns;
elsif (mux_select="01111") then
mux_out <= d15 after 5ns;
elsif (mux_select="10000") then
mux_out <= d16 after 5ns;
elsif (mux_select="10001") then
mux_out <= d17 after 5ns;
elsif (mux_select="10010") then
mux_out <= d18 after 5ns;
elsif (mux_select="10011") then
mux_out <= d19 after 5ns;
elsif (mux_select="10100") then
mux_out <= d20 after 5ns;
elsif (mux_select="10101") then
mux_out <= d21 after 5ns;
elsif (mux_select="10110") then
mux_out <= d22 after 5ns;
elsif (mux_select="10111") then
mux_out <= d23 after 5ns;
elsif (mux_select="11000") then
mux_out <= d24 after 5ns;
elsif (mux_select="11001") then
mux_out <= d25 after 5ns;
elsif (mux_select="11010") then
mux_out <= d26 after 5ns;
elsif (mux_select="11011") then
mux_out <= d27 after 5ns;
elsif (mux_select="11100") then
mux_out <= d28 after 5ns;
elsif (mux_select="11101") then
mux_out <= d29 after 5ns;
elsif (mux_select="11110") then
mux_out <= d30 after 5ns;
elsif (mux_select="11111") then
mux_out <= d31 after 5ns;
end if;
end process;
end Behavioral;
