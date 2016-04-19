--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:51:36 04/18/2016
-- Design Name:   
-- Module Name:   C:/Users/GEORGE/Google Drive/utp/octavo semestre/arquitectura de computadores/procesador/proyectoProcesador/tbSEU30.vhd
-- Project Name:  proyectoProcesador
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SEU30
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
 
ENTITY tbSEU30 IS
END tbSEU30;
 
ARCHITECTURE behavior OF tbSEU30 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SEU30
    PORT(
         seu30a : IN  std_logic_vector(29 downto 0);
         seu32n : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal seu30a : std_logic_vector(29 downto 0) := (others => '0');

 	--Outputs
   signal seu32n : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SEU30 PORT MAP (
          seu30a => seu30a,
          seu32n => seu32n
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
      -- hold reset state for 100 ns.
     seu30a <= "000000000000000000000000000000";
		wait for 100 ns;	
		
	   seu30a <= "100000000000000000000000000000";
		wait for 100 ns;	
		
		seu30a <= "111111111111111111111111111111";
		wait for 100 ns;	
      
		seu30a <= "011111111111111111111111111111";
		wait for 100 ns;	

      wait;
   end process;

END;
