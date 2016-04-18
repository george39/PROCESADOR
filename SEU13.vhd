----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:01:15 04/17/2016 
-- Design Name: 
-- Module Name:    SEU13 - arqProcesador 
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

entity SEU13 is
    Port ( SEU13A : in  STD_LOGIC_VECTOR (12 downto 0);
           SEU32 : out  STD_LOGIC_VECTOR (31 downto 0));
end SEU13;

architecture arqProcesador of SEU13 is

begin

  process(SEU13A)
	begin
		if(SEU13A(12) = '1')then
			SEU32(12 downto 0) <= SEU13A;
			SEU32(31 downto 13) <= (others=>'1');
		else
			SEU32(12 downto 0) <= SEU13A;
			SEU32(31 downto 13) <= (others=>'0');
		end if;
	end process;

end arqProcesador;

