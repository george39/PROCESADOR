----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:11:22 04/17/2016 
-- Design Name: 
-- Module Name:    SEU30 - arqProcesador 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SEU30 is
    Port ( seu30a : in  STD_LOGIC_VECTOR (29 downto 0);
           seu32n : out  STD_LOGIC_VECTOR (31 downto 0));
end SEU30;

architecture arqProcesador of SEU30 is

begin

process(seu30a)
	begin
		if(seu30a(29) = '1')then
			seu32n(29 downto 0) <= seu30a;
			seu32n(31 downto 30) <= (others=>'1');
		else
			seu32n(29 downto 0) <= seu30a;
			seu32n(31 downto 30) <= (others=>'0');
		end if;
	end process;

end arqProcesador;

