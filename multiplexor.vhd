----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:51:18 04/17/2016 
-- Design Name: 
-- Module Name:    multiplexor - arqProcesador 
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

entity multiplexor is
    Port ( crs2 : in  STD_LOGIC_VECTOR (31 downto 0);
           inmediato : in  STD_LOGIC_VECTOR (31 downto 0);
           i : in  STD_LOGIC;
           salidaALU : out  STD_LOGIC_VECTOR (31 downto 0));
end multiplexor;

architecture arqProcesador of multiplexor is

begin
 
  process(crs2,inmediato,i)
	begin
		if(i = '1')then
			salidaALU <= inmediato;
		else
			if(i = '0')then
				salidaALU <= crs2;
			end if;
		end if;
	end process;

end arqProcesador;

