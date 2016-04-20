--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use std.textio.all; 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tbinstructionMemory IS
END tbinstructionMemory;
 
ARCHITECTURE behavior OF tbinstructionMemory IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT instructionMemory
    PORT(
         
         MIentrada : IN  std_logic_vector(31 downto 0);
         reset : IN  std_logic;
         MIsalida : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   
   signal MIentrada : std_logic_vector(31 downto 0) := (others => '0');
   signal reset : std_logic := '0';

 	--Outputs
   signal MIsalida : std_logic_vector(31 downto 0);

   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: instructionMemory PORT MAP (
          
          MIentrada => MIentrada,
          reset => reset,
          MIsalida => MIsalida
        );

   
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      reset<='0';
		MIentrada<= X"00000000";
      wait for 100 ns;	
		reset<='0';
		MIentrada<= X"00000003";
      wait;
   end process;

END;
