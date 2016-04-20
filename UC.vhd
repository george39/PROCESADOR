----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:30:03 04/19/2016 
-- Design Name: 
-- Module Name:    UC - arqUC 
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

entity UC is
    Port ( op : in  STD_LOGIC_VECTOR (1 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           salida : out  STD_LOGIC_VECTOR (5 downto 0));
end UC;

architecture arqUC of UC is

begin

  process(op,op3)
  begin
 
if(op = "10")then				
						case op3 is
						
						   when "000001" => -- AND
								
								salida <= "000000";
								
								when "000101" => -- ADDN
								
								salida <= "000001";
								
							when "000000" => -- ADD
								
								salida <= "000010";
								--enableMem <= '1';
							
							when "000010" => -- OR
								
								salida <= "000011";
								
								when "000110" => -- ORN
								
								salida <= "000100";
								

							when "000100" => -- SUB
								
								salida <= "000101";
								
							
							when "000011" => -- XOR
								salida <= "000110";
							
							when "000111" => -- XORN
								salida <= "000111";
							
						
							
						
							
							when others => 
								
								salida <= "000000";
								
						end case;
						end if;
						end process;

end arqUC;

