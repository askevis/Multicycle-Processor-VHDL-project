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

entity IFSTAGE is
    Port ( PC_Immed : in  STD_LOGIC_VECTOR (31 downto 0);
           PC_sel : in  STD_LOGIC;
           PC_LdEn : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           Instr : out  STD_LOGIC_VECTOR (31 downto 0);
			  Mem_WrEn : in  STD_LOGIC;
           ALU_MEM_Addr : in  STD_LOGIC_VECTOR (31 downto 0);
           MEM_DataIn : in  STD_LOGIC_VECTOR (31 downto 0);
           MEM_DataOut : out  STD_LOGIC_VECTOR (31 downto 0));
end IFSTAGE;

architecture Behavioral of IFSTAGE is

component RAM is
port ( inst_addr : in std_logic_vector(10 downto 0);
		 inst_dout : out std_logic_vector(31 downto 0);
		 data_we : in std_logic;
		 data_addr : in std_logic_vector(10 downto 0);
		 data_din : in std_logic_vector(31 downto 0);
		 data_dout : out std_logic_vector(31 downto 0);
		 clk : in std_logic);
end component;

component Inc_imm is
    Port ( inc_imin : in  STD_LOGIC_VECTOR (31 downto 0);
           inc_in : in  STD_LOGIC_VECTOR (31 downto 0);
           inc_imout : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component Incrementor is
    Port ( incin : in  STD_LOGIC_VECTOR (31 downto 0);
           incout : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component MUX_2x1 is
    Port ( mdin : in  STD_LOGIC_VECTOR (31 downto 0);
           bmout : in  STD_LOGIC_VECTOR (31 downto 0);
           selcomp : in  STD_LOGIC;
           mout : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component Reg is
    Port ( Clock : in  STD_LOGIC;
           Data : in  STD_LOGIC_VECTOR (31 downto 0);
			  we : in  STD_LOGIC;
			  reset : in  STD_LOGIC;
           Dout : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component MemWrAddr is
    Port ( addrin : in  STD_LOGIC_VECTOR (10 downto 0);
           addrout : out  STD_LOGIC_VECTOR (10 downto 0));
end component;

signal newaddr: STD_LOGIC_VECTOR (10 downto 0);
signal pc_to_mem,inc_to_mux,mem_out : STD_LOGIC_VECTOR (31 downto 0);
signal mux_to_pc,incim_to_mux: STD_LOGIC_VECTOR (31 downto 0);

begin

PC: Reg
port map ( Clock => clk,
			  Data => mux_to_pc,
			  we => PC_LdEn,
			  reset => Reset,
			  Dout => pc_to_mem );

Inc: Incrementor
port map ( incin => pc_to_mem,
			  incout => inc_to_mux );

Inc_im: Inc_imm
port map ( inc_in => PC_Immed,
			  inc_imin => pc_to_mem,
			  inc_imout => incim_to_mux );

MUXtoPC: MUX_2x1
port map ( mdin => incim_to_mux,
			  bmout => inc_to_mux,
			  selcomp => PC_sel,
			  mout => mux_to_pc );
			  
newaddress: MemWrAddr 
port map ( addrin => ALU_MEM_Addr(10 downto 0),
			  addrout => newaddr );
			  
mem: RAM
port map ( clk =>Clk,
			  inst_addr => pc_to_mem(12 downto 2),
			  inst_dout =>Instr,
			  data_addr => newaddr,
			  data_we => Mem_WrEn,
			  data_din => MEM_DataIn,
			  data_dout => MEM_DataOut );

end Behavioral;

