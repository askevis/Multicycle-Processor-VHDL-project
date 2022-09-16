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

entity ALU is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           Op : in  STD_LOGIC_VECTOR (3 downto 0);
           Output : out  STD_LOGIC_VECTOR (31 downto 0);
           Zero : out  STD_LOGIC;
           Cout : out  STD_LOGIC;
           Ovf : out  STD_LOGIC);
end ALU;

architecture Behavioral of ALU is
signal result: STD_LOGIC_VECTOR (32 downto 0);

begin

process(A,B,Op,result)
begin
		--prosthesh
		if(Op="0000") then
			result(32 downto 0)<= ("0"&A(31 downto 0))+("0"&B(31 downto 0));
			Output(31 downto 0)<=result(31 downto 0) after 10ns;
			--zero
			if(result(31 downto 0) = "00000000000000000000000000000000") then
				Zero<='1';
			else
				Zero<='0';
			end if;
			--cout
			Cout<=result(32);
			--overflow
			if ((A(31)=B(31))and(result(31)=not(A(31)))) then
				Ovf <= '1';
			else
				Ovf <= '0';
			end if;
		--Afairesh
		elsif(Op="0001") then
			result(32 downto 0)<= ("0"&A(31 downto 0))+("0"&(not(B(31 downto 0))+1));
			--result(32 downto 0)<= ("0"&A(31 downto 0))-("0"& B(31 downto 0));
			Output(31 downto 0)<=result(31 downto 0) after 10ns;
			--elegxos gia zero
			if(result(31 downto 0) = "00000000000000000000000000000000") then
				Zero<='1';
			else
				Zero<='0';
			end if;
			--cout
			Cout<=result(32);
		   --overflow
			if ((A(31)= not B(31))and(result(31)=not(A(31)))) then
				Ovf <= '1';
			else
				Ovf <= '0';
			end if;
		--logiko AND
		elsif (Op="0010") then
			Output <= (A and B) after 10ns;
			Cout <= '0';
			Ovf  <= '0';
			Zero <= '0';
		--logiko NAND
		elsif (Op="0110") then
			Output <= not(A and B) after 10ns;
			Cout <= '0';
			Ovf  <= '0';
			Zero <= '0';
		-- logiko OR
		elsif (Op="0011") then
			Output <= (A or B) after 10ns;
			Cout <= '0';
			Ovf  <= '0';
			Zero <= '0';
		--logiko NOT
		elsif (Op="0100") then
			Output <= not A after 10ns;
			Cout <= '0';
			Ovf  <= '0';
			Zero <= '0';
		--arithmitiki olisthish dexia kata 1
		elsif(Op="1000") then
			Output <= A(31) & A(31 downto 1) after 10ns;
			Cout <= '0';
			Ovf <= '0';
			Zero <= '0';
		--logikh olisthish dexia kata 1
		elsif(Op="1001") then
			Output <= '0' & A(31 downto 1) after 10ns;
			Cout <= '0';
			Ovf <= '0';
			Zero <= '0';
		--logikh olisthish aristera kata 1
		elsif(Op="1010") then
			Output <= A(30 downto 0) & '0' after 10ns;
			Cout <= '0';
			Ovf <= '0';
			Zero <= '0';
		--rotate aristera
		elsif(Op="1100") then
			Output <= A(30 downto 0) & A(31) after 10ns;
			Cout <= '0';
			Ovf <= '0';
			Zero <= '0';
		--rotate dexia
		elsif(Op="1101") then
			Output <= A(0) & A(31 downto 1) after 10ns;
			Cout <= '0';
			Ovf <= '0';
			Zero <= '0';
		end if;
	end process;
end Behavioral;

