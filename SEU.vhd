library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SEU is
    Port ( entrada_seu : in  STD_LOGIC_VECTOR (12 downto 0);
           salida_seu : out  STD_LOGIC_VECTOR (31 downto 0));
end SEU;

architecture ArqProcesador of SEU is

begin

  process(entrada_seu)
	begin
		if(entrada_seu(12) = '1')then
			salida_seu(12 downto 0) <= entrada_seu;
			salida_seu(31 downto 13) <= (others=>'1');
		else
			salida_seu(12 downto 0) <= entrada_seu;
			salida_seu(31 downto 13) <= (others=>'0');
		end if;
	end process;


end ArqProcesador;

