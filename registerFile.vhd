----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RF is
    Port ( reset : in  STD_LOGIC;
           rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
           rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
           rd : in  STD_LOGIC_VECTOR (4 downto 0);
           salida_alu : in  STD_LOGIC_VECTOR (31 downto 0);
           crs1 : out  STD_LOGIC_VECTOR (31 downto 0);
           crs2 : out  STD_LOGIC_VECTOR (31 downto 0));
end RF;

architecture ArqProcesador of RF is

type ram_type is array (0 to 39) of std_logic_vector (31 downto 0);
	signal registers : ram_type := (others => x"00000000");

begin
   
	process(reset,rs1,rs2,rd,salida_alu)
	begin
	   
		if(reset = '1')then
			crs1 <= (others=>'0');
			crs2 <= (others=>'0');
			registers <= (others => x"00000000");
		else
			crs1 <= registers(conv_integer(rs1));
			crs2 <= registers(conv_integer(rs2));
			if (rd /= "00000") then 
			   registers (conv_integer(rd)) <= salida_alu;
			end if;
		end if;
	end process;

end ArqProcesador;

