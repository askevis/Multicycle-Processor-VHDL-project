library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Reg_File_Top_Level is
    Port ( clk : in  STD_LOGIC;
           Ard1 : in  STD_LOGIC_VECTOR (4 downto 0);
           Ard2 : in  STD_LOGIC_VECTOR (4 downto 0);
           Awr : in  STD_LOGIC_VECTOR (4 downto 0);
           Din : in  STD_LOGIC_VECTOR (31 downto 0);
           WrEn : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           Dout1 : out  STD_LOGIC_VECTOR (31 downto 0);
           Dout2 : out  STD_LOGIC_VECTOR (31 downto 0));
end Reg_File_Top_Level;

architecture Behavioral of Reg_File_Top_Level is

component Decoder is
    Port ( awr1 : in  STD_LOGIC_VECTOR (4 downto 0);
           Oawr : out  STD_LOGIC_VECTOR (31 downto 0));
end component;


component MUX_32 is
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
end component;


component Reg is
    Port ( Clock : in  STD_LOGIC;
           Data : in  STD_LOGIC_VECTOR (31 downto 0);
           we : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Dout : out  STD_LOGIC_VECTOR (31 downto 0));
end component ;

signal decode_out: STD_LOGIC_VECTOR (31 downto 0);
signal reg0out,reg1out,reg2out,reg3out,reg4out,reg5out,reg6out,reg7out,reg8out,reg9out,reg10out,reg11out,reg12out,reg13out,reg14out,reg15out,reg16out,reg17out,reg18out :STD_LOGIC_VECTOR (31 downto 0);
signal reg19out,reg20out,reg21out,reg22out,reg23out,reg24out,reg25out,reg26out,reg27out,reg28out,reg29out,reg30out,reg31out:STD_LOGIC_VECTOR (31 downto 0);
signal wr0,wr1,wr2,wr3,wr4,wr5,wr6,wr7,wr8,wr9,wr10,wr11,wr12,wr13,wr14,wr15,wr16,wr17,wr18,wr19,wr20,wr21,wr22,wr23,wr24,wr25,wr26,wr27,wr28,wr29,wr30,wr31: STD_LOGIC;

begin

decode:Decoder
port map
(
awr1 => Awr,
Oawr => decode_out
);

wr0<=decode_out(0) and WrEn after 2ns;
wr1<=decode_out(1) and WrEn after 2ns;
wr2<=decode_out(2) and WrEn after 2ns;
wr3<=decode_out(3) and WrEn after 2ns;
wr4<=decode_out(4) and WrEn after 2ns;
wr5<=decode_out(5) and WrEn after 2ns;
wr6<=decode_out(6) and WrEn after 2ns;
wr7<=decode_out(7) and WrEn after 2ns;
wr8<=decode_out(8) and WrEn after 2ns;
wr9<=decode_out(9) and WrEn after 2ns;
wr10<=decode_out(10) and WrEn after 2ns;
wr11<=decode_out(11) and WrEn after 2ns;
wr12<=decode_out(12) and WrEn after 2ns;
wr13<=decode_out(13) and WrEn after 2ns;
wr14<=decode_out(14) and WrEn after 2ns;
wr15<=decode_out(15) and WrEn after 2ns;
wr16<=decode_out(16) and WrEn after 2ns;
wr17<=decode_out(17) and WrEn after 2ns;
wr18<=decode_out(18) and WrEn after 2ns;
wr19<=decode_out(19) and WrEn after 2ns;
wr20<=decode_out(20) and WrEn after 2ns;
wr21<=decode_out(21) and WrEn after 2ns;
wr22<=decode_out(22) and WrEn after 2ns;
wr23<=decode_out(23) and WrEn after 2ns;
wr24<=decode_out(24) and WrEn after 2ns;
wr25<=decode_out(25) and WrEn after 2ns;
wr26<=decode_out(26) and WrEn after 2ns;
wr27<=decode_out(27) and WrEn after 2ns;
wr28<=decode_out(28) and WrEn after 2ns;
wr29<=decode_out(29) and WrEn after 2ns;
wr30<=decode_out(30) and WrEn after 2ns;
wr31<=decode_out(31) and WrEn after 2ns;


reg0:reg
port map(
Clock=> clk,
Data=> "00000000000000000000000000000000",
we => wr0,
Reset => rst,
Dout=> reg0out );

reg1:reg
port map(
Clock=> clk,
Data=> Din,
we => wr1,
Reset => rst,
Dout=> reg1out );

reg2:reg
port map(
Clock=> clk,
Data=> Din,
we => wr2,
Reset => rst,
Dout=> reg2out );

reg3:reg
port map(
Clock=> clk,
Data=> Din,
we => wr3,
Reset => rst,
Dout=> reg3out );

reg4:reg
port map(
Clock=> clk,
Data=> Din,
we => wr4,
Reset => rst,
Dout=> reg4out );

reg5:reg
port map(
Clock=> clk,
Data=> Din,
we => wr5,
Reset => rst,
Dout=> reg5out );

reg6:reg
port map(
Clock=> clk,
Data=> Din,
we => wr6,
Reset => rst,
Dout=> reg6out );

reg7:reg
port map(
Clock=> clk,
Data=> Din,
we => wr7,
Reset => rst,
Dout=> reg7out );

reg8:reg
port map(
Clock=> clk,
Data=> Din,
we => wr8,
Reset => rst,
Dout=> reg8out );

reg9:reg
port map(
Clock=> clk,
Data=> Din,
we => wr9,
Reset => rst,
Dout=> reg9out );

reg10:reg
port map(
Clock=> clk,
Data=> Din,
we => wr10,
Reset => rst,
Dout=> reg10out );

reg11:reg
port map(
Clock=> clk,
Data=> Din,
we => wr11,
Reset => rst,
Dout=> reg11out );

reg12:reg
port map(
Clock=> clk,
Data=> Din,
we => wr12,
Reset => rst,
Dout=> reg12out );

reg13:reg
port map(
Clock=> clk,
Data=> Din,
we => wr13,
Reset => rst,
Dout=> reg13out );

reg14:reg
port map(
Clock=> clk,
Data=> Din,
we => wr14,
Reset => rst,
Dout=> reg14out );

reg15:reg
port map(
Clock=> clk,
Data=> Din,
we => wr15,
Reset => rst,
Dout=> reg15out );

reg16:reg
port map(
Clock=> clk,
Data=> Din,
we => wr16,
Reset => rst,
Dout=> reg16out );

reg17:reg
port map(
Clock=> clk,
Data=> Din,
we => wr17,
Reset => rst,
Dout=> reg17out );

reg18:reg
port map(
Clock=> clk,
Data=> Din,
we => wr18,
Reset => rst,
Dout=> reg18out );

reg19:reg
port map(
Clock=> clk,
Data=> Din,
we => wr19,
Reset => rst,
Dout=> reg19out );

reg20:reg
port map(
Clock=> clk,
Data=> Din,
we => wr20,
Reset => rst,
Dout=> reg20out );

reg21:reg
port map(
Clock=> clk,
Data=> Din,
we => wr21,
Reset => rst,
Dout=> reg21out );

reg22:reg
port map(
Clock=> clk,
Data=> Din,
we => wr22,
Reset => rst,
Dout=> reg22out );

reg23:reg
port map(
Clock=> clk,
Data=> Din,
we => wr23,
Reset => rst,
Dout=> reg23out );

reg24:reg
port map(
Clock=> clk,
Data=> Din,
we => wr24,
Reset => rst,
Dout=> reg24out );

reg25:reg
port map(
Clock=> clk,
Data=> Din,
we => wr25,
Reset => rst,
Dout=> reg25out );

reg26:reg
port map(
Clock=> clk,
Data=> Din,
we => wr26,
Reset => rst,
Dout=> reg26out );

reg27:reg
port map(
Clock=> clk,
Data=> Din,
we => wr27,
Reset => rst,
Dout=> reg27out );

reg28:reg
port map(
Clock=> clk,
Data=> Din,
we => wr28,
Reset => rst,
Dout=> reg28out );

reg29:reg
port map(
Clock=> clk,
Data=> Din,
we => wr29,
Reset => rst,
Dout=> reg29out );

reg30:reg
port map(
Clock=> clk,
Data=> Din,
we => wr30,
Reset => rst,
Dout=> reg30out );

reg31:reg
port map(
Clock=> clk,
Data=> Din,
we => wr31,
Reset => rst,
Dout=> reg31out );


mux32_1:MUX_32 
Port map ( 
d0 =>reg0out,
d1 =>reg1out,
d2 =>reg2out,
d3 =>reg3out,
d4 =>reg4out,
d5 =>reg5out,
d6 =>reg6out,
d7 =>reg7out,
d8 =>reg8out,
d9 =>reg9out,
d10 =>reg10out,
d11 =>reg11out,
d12 =>reg12out,
d13 =>reg13out,
d14 =>reg14out,
d15 =>reg15out,
d16 =>reg16out,
d17 =>reg17out,
d18 =>reg18out,
d19 =>reg19out,
d20 =>reg20out,
d21 =>reg21out,
d22 =>reg22out,
d23 =>reg23out,
d24 =>reg24out,
d25 =>reg25out,
d26 =>reg26out,
d27 =>reg27out,
d28 =>reg28out,
d29 =>reg29out,
d30 =>reg30out,
d31 =>reg31out,
mux_select=> Ard1,
mux_out => Dout1 );

mux32_2:MUX_32 
Port map ( 
d0 =>reg0out,
d1 =>reg1out,
d2 =>reg2out,
d3 =>reg3out,
d4 =>reg4out,
d5 =>reg5out,
d6 =>reg6out,
d7 =>reg7out,
d8 =>reg8out,
d9 =>reg9out,
d10 =>reg10out,
d11 =>reg11out,
d12 =>reg12out,
d13 =>reg13out,
d14 =>reg14out,
d15 =>reg15out,
d16 =>reg16out,
d17 =>reg17out,
d18 =>reg18out,
d19 =>reg19out,
d20 =>reg20out,
d21 =>reg21out,
d22 =>reg22out,
d23 =>reg23out,
d24 =>reg24out,
d25 =>reg25out,
d26 =>reg26out,
d27 =>reg27out,
d28 =>reg28out,
d29 =>reg29out,
d30 =>reg30out,
d31 =>reg31out,
mux_select=> Ard2,
mux_out => Dout2 );


end Behavioral;