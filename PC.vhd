----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:55:00 04/09/2016 
-- Design Name: 
-- Module Name:    PC - arq_PC 
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

entity PC is
    Port ( PC_IN : in  STD_LOGIC_VECTOR (31 downto 0);
           rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           PC_OUT : out  STD_LOGIC_VECTOR (31 downto 0));
end PC;

architecture arq_PC of PC is

begin
     
	    process(clk)
		 begin
		     
			      if(rising_edge(clk))then
					         if(rst = '1')then
								        PC_OUT <= (others=>'0');
					         else
                	              PC_OUT <= PC_IN;
                        end if;
					end if;			
        end process;					
end arq_PC;

