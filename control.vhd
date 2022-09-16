library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity control is
    Port ( Opcode : in  STD_LOGIC_VECTOR (5 downto 0);
           Func : in STD_LOGIC_VECTOR (3 downto 0);
			  ALU_Zero : in  STD_LOGIC;
			  clk: in STD_LOGIC;
			  PC_Sel : out  STD_LOGIC;
           PC_LdEn : out  STD_LOGIC;
           RF_B_sel : out  STD_LOGIC;
           RF_WrData_sel : out  STD_LOGIC_VECTOR (1 downto 0);
           ALU_Bin_sel : out  STD_LOGIC;
			  rst_in : in STD_LOGIC;
			  rst_out : out STD_LOGIC;
           RF_Wr_en : out  STD_LOGIC;
			  ALU_func : out  STD_LOGIC_VECTOR (3 downto 0);
           MEM_Wr_En : out  STD_LOGIC);
end control;

architecture Behavioral of control is

type state Is (WriteEnd,waitstate,IFstate,Rinst,WriteReg,LiLui,Addi,Nandi,Ori,Alui,B,Beq,Beq2,Beq3,Bne,Bne2,Bne3,StoreByte,StoreWord,WriteMem,LoadByte,LoadByte2,LoadWord,LoadWord2);

signal Control: state;

begin
rst_out<=rst_in;
	Process
	begin
		wait until clk'event and clk = '1';
		if (rst_in='1') then
			PC_Sel <= '0';
			PC_LdEn <= '0';
			RF_B_sel <= '0';
			RF_WrData_sel <= "00";
			ALU_Bin_sel <= '0';
			RF_Wr_en <= '0';
			ALU_func <= "0000";
			MEM_Wr_En <= '0';
		Control <= WriteEnd;
		else
		case Control is
						when WriteEnd=>
							RF_WrData_sel <= "00";
							RF_Wr_en<='0';
							PC_LdEn <= '0';
							MEM_Wr_En<='0';
							Control <= waitstate;
							
						when waitstate =>
							Control <= IFstate;	
						
						when IFstate=>
							
							if(Opcode="100000") then
								Control <= Rinst;
							elsif(Opcode="111000" or Opcode="111001") then
								Control <= LiLui;
							elsif(Opcode="110000") then
								Control<=Addi;
							elsif(Opcode="110010") then
								Control<=Nandi;
							elsif(Opcode="110011") then
								Control<=Ori;
							elsif(Opcode="111111") then
								Control<=B;
							elsif(Opcode="000000") then
								Control<=Beq;
							elsif(Opcode="000001") then
								Control<=Bne;
							elsif(Opcode="000111") then
								Control<=StoreByte;
							elsif(Opcode="000011") then
								Control<=LoadByte;
							elsif(Opcode="011111") then
								Control<=StoreWord;
							elsif(Opcode="001111") then
								Control<=LoadWord;
							end if;
					
						when LiLui=>
							RF_Wr_en<='1';
							RF_WrData_sel<="10";
							PC_sel<='0';
							PC_LdEn <= '1';
							Control<=WriteEnd;

						when Addi=>
							RF_B_sel<='0';
							ALU_func<="0000";
							ALU_Bin_sel<='1';
							Control<=Alui;
							
						when Nandi=>
							RF_B_sel<='0';
							ALU_func<="0010";
							ALU_Bin_sel<='1';
							Control<=Alui;
							
						when Ori=>
							RF_B_sel<='0';
							ALU_func<="0011";
							ALU_Bin_sel<='1';
							Control<=Alui;
							
						when Alui=>
							PC_sel<='0';
							PC_LdEn <= '1';
							RF_WrData_sel<="00";
							RF_Wr_en<='1';
							Control<=WriteEnd;
							
						when B=>
							PC_sel<='1';
							PC_LdEn <= '1';
							Control<=WriteEnd;
							
						when Beq=>
							RF_B_sel<='1';
							ALU_func<="0001";
							ALU_Bin_sel<='0';
							Control<=Beq2;
							
						when Beq2=>
							Control<=Beq3;
							
						when Beq3=>
							if(ALU_Zero='1') then
								PC_sel<='1';
							else
								PC_sel<='0';
							end if;
							PC_LdEn <= '1';
							Control<=WriteEnd;
							
						when Bne=>
							RF_B_sel<='1';
							ALU_func<="0001";
							ALU_Bin_sel<='0';
							Control<=Bne2;
							
						when Bne2=>
							Control<=Bne3;
							
						when Bne3=>
							if(ALU_Zero='1') then
								PC_sel<='0';
							else
								PC_sel<='1';
							end if;
							PC_LdEn <= '1';
							Control<=WriteEnd;
					
						when StoreByte=>
							RF_B_sel<='1';
							ALU_Bin_sel<='1';
							ALU_func<="0000";
							Control<=WriteMem;
							
						when StoreWord=>
							RF_B_sel<='1';
							ALU_Bin_sel<='1';
							ALU_func<="0000";
							Control<=WriteMem;
				
						when WriteMem=>  
							MEM_Wr_En<='1';
							PC_sel<='0';
							PC_LdEn <= '1';
							Control<=WriteEnd;
					
						when LoadByte=>
							ALU_Bin_sel<='1';
							ALU_func<="0000";
							Control<=LoadByte2;
							
						when LoadByte2=>
							RF_WrData_sel<="01";
							RF_Wr_en<='1';
							PC_sel<='0';
							PC_LdEn <= '1';
							Control<=WriteEnd;
					
						when LoadWord=>
							ALU_Bin_sel<='1';
							ALU_func<="0000";
							Control<=LoadWord2;
							
						when LoadWord2=>
							RF_WrData_sel<="01";
							RF_Wr_en<='1';
							PC_sel<='0';
							PC_LdEn <= '1';
							Control<=WriteEnd;

						when Rinst=>--rtype commands, add klp
							RF_B_sel<='0';
							ALU_func<=Func;
							ALU_Bin_sel<='0';
							Control<=WriteReg;
							
						when WriteReg=>
							PC_sel<='0';
							RF_WrData_sel<="00";
							PC_LdEn <= '1';
							RF_Wr_en<='1';
							Control<=WriteEnd;
					end case;
end if;
end process;
end Behavioral;

