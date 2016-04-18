library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PC is
    Port ( PCentrada : in  STD_LOGIC_VECTOR (31 downto 0);
           reset : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           PCsalida : out  STD_LOGIC_VECTOR (31 downto 0));
end PC;

architecture arqProcesador of PC is

begin

process(clk)
	begin
		if(rising_edge(clk))then
			if(reset = '1')then
				PCsalida <= (others=>'0');
			else
				PCsalida <= PCentrada;
			end if;
		end if;
	end process;

end arqProcesador;

