--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:43:31 04/18/2016
-- Design Name:   
-- Module Name:   C:/Users/GEORGE/Google Drive/utp/octavo semestre/arquitectura de computadores/procesador/proyectoProcesador/tbSEU22.vhd
-- Project Name:  proyectoProcesador
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SEU22
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tbSEU22 IS
END tbSEU22;
 
ARCHITECTURE behavior OF tbSEU22 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SEU22
    PORT(
         SEU22A : IN  std_logic_vector(21 downto 0);
         SEU32 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal SEU22A : std_logic_vector(21 downto 0) := (others => '0');

 	--Outputs
   signal SEU32 : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SEU22 PORT MAP (
          SEU22A => SEU22A,
          SEU32 => SEU32
        );

   -- Clock process definitions
   --<clock>_process :process
   --begin
		--<clock> <= '0';
		--wait for <clock>_period/2;
		--<clock> <= '1';
		--wait for <clock>_period/2;
   --end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
       SEU22A <= "0000000000000000000000";
		wait for 100 ns;	
		
	   SEU22A <= "1000000000000000000000";
		wait for 100 ns;	
		
		SEU22A <= "1111111111111111111111";
		wait for 100 ns;	
      
		SEU22A <= "0111111111111111111111";
		wait for 100 ns;	
     


      wait;
   end process;

END;
