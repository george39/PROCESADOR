----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:06:31 04/17/2016 
-- Design Name: 
-- Module Name:    SEU - arqSeu 
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

entity SEU is
    Port ( SIMM22 : in  STD_LOGIC_VECTOR (21 downto 0);
           SEUout : out  STD_LOGIC_VECTOR (31 downto 0));
end SEU;

architecture arqSeu of SEU is

begin

process(SIMM22)
begin

if SIMM22(21) = '1' then
  SEUout <= "1111111111" & SIMM22;
  else
  SEUout <= "0000000000" & SIMM22;
  end if;
 end process;

end arqSeu;

